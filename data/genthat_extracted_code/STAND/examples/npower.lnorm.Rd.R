library(STAND)


### Name: npower.lnorm
### Title: Sample Size and Power For Lognormal Distribution
### Aliases: npower.lnorm
### Keywords: htest

### ** Examples

#                              EXAMPLE 1
#    Table VII.1 Mulhausen and Damiano (1998) adapted from
#    Table II in Lyles and Kupper (1996) JAIHA vol 57 6-15 Table II
#    Sample Size Needed When Using UTL(95,95) to Show 95% Confidence
#    that the 95th Percentile is below the OEL (Power = 0.8)
rx<-c(1.5,2,2.5,3)
sdx<- sqrt(c(0.5,1,1.5,2,2.5,3))
tabn<-matrix(0,4,6)
for ( i in 1:4) {
  for (j in 1:6) {
fstar<- 100*(1 -pnorm( log(rx[i])/sdx[j] + qnorm(0.95) ))
tabn[i,j]<- npower.lnorm(NA,0.8,fstar,p=0.95,gamma=0.95)[1] 
}
}
cn<- paste("GSD = ",round(exp(sdx),2),sep="" )
dimnames(tabn)<-list( round(1/rx,2),cn)
rm(cn,rx,sdx)
tabn
#                              EXAMPLE 2
top<-"Power For Sample Size n = 20 for p=0.95 gamma=0.95"
fstar <- seq(0.2,4.8,0.1)
pow <- rep(1,length(fstar))
for (i in 1 : length(fstar)) {
pow[i]<-npower.lnorm(20,NA,fstar[i],p=0.95,gamma=0.95)[2]
}
plot(fstar,pow,xlim=c(0,5),ylim=c(0,1),main=top,
xlab="fstar = True Percent of Xs > L(Specified Limit )",ylab="Power")



