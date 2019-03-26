library(MCPMod)


### Name: plot.LP
### Title: Plot method for LP objects
### Aliases: plot.LP
### Keywords: methods hplot

### ** Examples

## Not run: 
##D doses <- c(0,10,25,50,100,150)                                           
##D models <- list(linear=NULL, emax=c(25),
##D            logistic=c(50,10.88111), exponential=c(85),
##D            betaMod=matrix(c(0.33,2.31,1.39,1.39),byrow=TRUE,nrow=2))
##D 
##D # Examples from JBS paper, p.654
##D LPobj <- LP(models, model = "emax", type = "both", paramRange = c(10,70),
##D            doses = doses, base = 0, maxEff = 0.4, sigma = 1, n = 60,     
##D            alpha = 0.05, len = 15, scal = 200)
##D plot(LPobj)
##D plot(LPobj, line = FALSE, type = "LP1")
##D plot(LPobj, type = "LP1", spldf = 9)
## End(Not run)



