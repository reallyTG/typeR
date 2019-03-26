library(DOvalidation)


### Name: hazard.MBC
### Title: Multiplicative Bias Corrected Hazard Estimator
### Aliases: hazard.MBC
### Keywords: nonparametric survival

### ** Examples

data(Iceland)
Oi<-Iceland$D
Ei<-Iceland$E
ti<-40:110  # time is age and it goes from 40 to 110 years
res<-hazard.MBC(xi=ti,Oi=Oi,Ei=Ei,x=ti,b=48.7)
plot(ti,res$hMBC,main='Hazard estimate',xlab='age',ylab='',type='l',lwd=2)



