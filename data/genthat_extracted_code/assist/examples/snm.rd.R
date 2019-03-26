library(assist)


### Name: snm
### Title: Fit a Semi-parametric Nonlinear Mixed-effects Model
### Aliases: snm
### Keywords: file

### ** Examples

## Not run: 
##D data(CO2)
##D 
##D options(contrasts=rep("contr.treatment", 2))	
##D co2.fit1 <- nlme(uptake~exp(a1)*(1-exp(-exp(a2)*(conc-a3))), 
##D                  fixed=list(a1+a2~Type*Treatment,a3~1), 
##D                  random=a1~1, groups=~Plant, 
##D                  start=c(log(30),0,0,0,log(0.01),0,0,0,50),
##D                  data=CO2)
##D 
##D M <- model.matrix(~Type*Treatment, data=CO2)[,-1]
##D co2.fit2 <- snm(uptake~exp(a1)*f(exp(a2)*(conc-a3)),
##D                 func=f(u)~list(~I(1-exp(-u))-1,lspline(u, type="exp")),
##D                 fixed=list(a1~M-1,a3~1,a2~Type*Treatment),
##D                 random=list(a1~1), group=~Plant, verbose=TRUE,
##D                 start=co2.fit1$coe$fixed[c(2:4,9,5:8)], data=CO2)
## End(Not run)



