library(assist)


### Name: intervals.snr
### Title: Calculate Predictions and Approximate Posterior Standard
###   Deviations for Spline Estimates From a snr Object
### Aliases: intervals.snr
### Keywords: file

### ** Examples


## Not run: 
##D data(CO2)
##D options(contrasts=rep("contr.treatment", 2))  
##D 
##D ## get start values  
##D co2.fit1 <- nlme(uptake~exp(a1)*(1-exp(-exp(a2)*(conc-a3))), 
##D                  fixed=list(a1+a2~Type*Treatment,a3~1), 
##D                  random=a1~1, groups=~Plant, 
##D                  start=c(log(30),0,0,0,log(0.01),0,0,0,50),
##D                  data=CO2)
##D 
##D M <- model.matrix(~Type*Treatment, data=CO2)[,-1]
##D 
##D ## fit a SNR model
##D co2.fit2 <- snr(uptake~exp(a1)*f(exp(a2)*(conc-a3)),
##D                 func=f(u)~list(~I(1-exp(-u))-1,lspline(u, type="exp")),
##D                 params=list(a1~M-1, a3~1, a2~Type*Treatment),
##D                 start=list(params=co2.fit1$coe$fixed[c(2:4,9,5:8)]), data=CO2)
##D 
##D p.co2.fit2<- intervals(co2.fit2, newdata=data.frame(u=seq(0,10,len=50)))
## End(Not run)



