library(MCMCpack)


### Name: MCMCprobit
### Title: Markov Chain Monte Carlo for Probit Regression
### Aliases: MCMCprobit
### Keywords: models

### ** Examples


   ## Not run: 
##D    data(birthwt)
##D    out1 <- MCMCprobit(low~as.factor(race)+smoke, data=birthwt,
##D    	b0 = 0, B0 = 10, marginal.likelihood="Chib95")
##D    out2 <- MCMCprobit(low~age+as.factor(race), data=birthwt,
##D    	b0 = 0, B0 = 10,  marginal.likelihood="Chib95")
##D    out3 <- MCMCprobit(low~age+as.factor(race)+smoke, data=birthwt,
##D    	b0 = 0, B0 = 10,  marginal.likelihood="Chib95")
##D    BayesFactor(out1, out2, out3)
##D    plot(out3)
##D    summary(out3)
##D    
## End(Not run)




