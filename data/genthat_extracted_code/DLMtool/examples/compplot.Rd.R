library(DLMtool)


### Name: compplot
### Title: Generic comparison plot for simulation testing of Stochastic SRA
###   method
### Aliases: compplot

### ** Examples

nyears<-100
nsims<-200
simy<-sin(seq(0,2,length.out=nyears))
samy<-array(rep(simy,each=nsims)*rnorm(nsims,1,0.2)*rnorm(nsims*nyears,1,0.1),c(nsims,nyears))
par(mfrow=c(1,2))
compplot(simy,samy,xlab="Year",ylab="Some time varying parameter")



