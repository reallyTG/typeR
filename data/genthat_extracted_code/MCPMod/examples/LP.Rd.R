library(MCPMod)


### Name: LP
### Title: Sensitivity analysis for misspecification of standardized model
###   parameters
### Aliases: LP print.LP
### Keywords: design

### ** Examples

## Not run: 
##D doses <- c(0,10,25,50,100,150)
##D models <- list(linear=NULL, emax=c(25),
##D            logistic=c(50,10.88111), exponential=c(85),
##D            betaMod=matrix(c(0.33,2.31,1.39,1.39),byrow=TRUE,nrow=2))
##D 
##D # Examples from JBS paper, p.654
##D LPobj <- LP(models, model = "emax", type = "both", paramRange = c(10,70),
##D           doses = doses, base = 0, maxEff = 0.4, sigma = 1, n = 60,
##D           alpha = 0.05, len = 15, scal = 200)
##D print(LPobj)
##D plot(LPobj)
##D 
##D # for exponential model with fullMod and LP1:
##D fMod <- fullMod(models, doses, base = 0, maxEff = 0.4, scal=200)
##D LPobj <- LP(fMod, "exponential", "LP1", c(50, 120), sigma = 1,
##D             alpha = 0.05, len = 20, n = 60)
##D plot(LPobj)
##D 
##D # Examples for models with two standardized model parameters
##D LP(models, "betaMod", "LP1", 
##D    paramRange = matrix(c(0.3,1.9,0.4,2.5),nrow=2),
##D    doses, 0, 0.4, 1, 60, alpha=0.05, len=c(10,4), scal=200)
##D #  Time consuming example
##D LPobj <- LP(models, "logistic", "both",
##D             paramRange = matrix(c(40,5,60,15),nrow=2),    
##D             doses, 0, 0.4, 1, 60, alpha=0.05, len=c(10,4), scal=200)
##D plot(LPobj)
## End(Not run)



