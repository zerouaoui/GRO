 NB INIT    I    �Nodes names 

end

States of nodes 
x[1:12] = 0
print -T'10'  -F'resultats_f' x
end

States of mutable directed arcs 

end

States of mutable undirected arcs 

end

Constants 
lambda = 0.9
pcb = 0.4
mucb = 0.3
muncb = 0.1
end

 E-N N0 x[1] =random() < lambda     
 E-N N1 %x[2] =(x[2]>0)*(x[2]-1+d32)+d12     
 E-N N2 'x[3] = d23 + x[3]*(1-d23)*(1-d43)     
 E-N N3 x[4] =random()<mucb     
 E-N N4 &x[5] = (x[5]>0)*(x[5]-1+d65)+d15     
 E-N N5 'x[6] = d56 + x[6]*(1-d56)*(1-d76)     
 E-N N6 x[7] =random() < muncb
 E-N N7 &x[8] = (x[8]>0)*(x[8]-1+d98)+d18     
 E-N N8 (x[9] = d89 + x[9]*(1-d89)*(1-d109)     
 E-N N9 /x[10] = random() < 1/(1/mucb+1/muncb)/2.0     
 E-N N10 "x[11] = x[11]+d311+d611+d911     
 E-N N11 x[12] =random()<pcb
 DO-FL  ARC ( N12 --- N1 ) double d121=x[12]     
 DO-FL  ARC ( N3 --- N11 ) double d311=x[3]*d43     
 DO-FL  ARC ( N6 --- N11 ) double d611= x[6]*d76     
 DO-FL  ARC ( N9 --- N11 ) double d911=x[9]*d109     
 DO-FL  ARC ( N4 --- N3 ) double d43=x[4]     
 DO-FL  ARC ( N7 --- N6 ) double d76=x[7]     
 DO-FL  ARC ( N10 --- N9 ) double d109=x[10]     
 DO-FL  ARETE ( N1 --- N2 ) >double d12 = x[1]*d121*(d21<=d81)     
double d21 = x[2]     
 DO-FL  ARETE ( N1 --- N5 ) Bdouble d15 = x[1]*(1-d121)*(d51<=d81)     
double d51 = x[5]     
 DO-FL  ARETE ( N1 --- N8 ) Tdouble d18 = x[1]*((x[2]>x[8])*d121+(x[5]>x[8])*(1-d121))   
double d81 = x[8]     
 DO-FL  ARETE ( N9 --- N8 ) 3double d98 = x[9]*(1-d109)
double d89 = (x[8] > 0)
 DO-FL  ARETE ( N5 --- N6 ) <double d56 = (x[5] > 0)     
double d65 = x[6]*(1-d76)     
 DO-FL  ARETE ( N2 --- N3 ) :double d23 = (x[2]>0)     
double d32 = x[3]*(1-d43)     
