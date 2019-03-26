library(zoeppritz)


### Name: zoeppritz
### Title: Zoeppritz Equations
### Aliases: zoeppritz
### Keywords: misc

### ** Examples



#########  set up 2-layer model
 
 
 alpha1 = 4.98
  beta1 =  2.9
   rho1 = 2.667

  alpha2 = 8.0
   beta2 = 4.6
   rho2 = 3.38
###################  P-wave incident = 1
     incw=1;
   icoef=1

A =  zoeppritz(icoef, alpha1, alpha2, beta1, beta2, rho1,rho2,   incw)

plot(A$angle, A$rmat[,1], xlab="Incident Angle", ylab="Ratio of Amplitudes",
main="P-wave incident/P-wave Reflected" )

plot(A$angle, A$rmat[,2], xlab="Incident Angle", ylab="Ratio of Amplitudes",
main="P-wave incident/S-wave Reflected" )

plot(A$angle, A$rmat[,3], xlab="Incident Angle", ylab="Ratio of Amplitudes",
main="P-wave incident/P-wave Refracted" )

plot(A$angle, A$rmat[,4], xlab="Incident Angle", ylab="Ratio of Amplitudes",
main="P-wave incident/S-wave Refracted" )

###################  S-wave incident = 2
     incw=2
   icoef=1

A =  zoeppritz(icoef, alpha1, alpha2, beta1, beta2, rho1,rho2,   incw)

plot(A$angle, A$rmat[,1], xlab="Incident Angle", ylab="Ratio of Amplitudes",
main="S-wave incident/P-wave Reflected" )

plot(A$angle, A$rmat[,2], xlab="Incident Angle", ylab="Ratio of Amplitudes",
main="S-wave incident/S-wave Reflected" )

plot(A$angle, A$rmat[,3], xlab="Incident Angle", ylab="Ratio of Amplitudes",
main="S-wave incident/P-wave Refracted" )

plot(A$angle, A$rmat[,4], xlab="Incident Angle", ylab="Ratio of Amplitudes",
main="S-wave incident/S-wave Refracted" )








