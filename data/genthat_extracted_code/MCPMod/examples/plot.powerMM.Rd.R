library(MCPMod)


### Name: plot.powerMM
### Title: Plot method for powerMM objects
### Aliases: plot.powerMM
### Keywords: methods hplot

### ** Examples

## Not run: 
##D # Example from JBS paper
##D doses <- c(0,10,25,50,100,150)                                         
##D models <- list(linear = NULL, emax = 25,                               
##D                logistic = c(50, 10.88111), exponential= 85,            
##D                betaMod=matrix(c(0.33,2.31,1.39,1.39), byrow=TRUE, nrow=2))
##D pM <- powerMM(models, doses, base = 0, maxEff = 0.4, sigma = 1,       
##D                lower = 10, upper = 100, step = 20, scal = 200)        
##D pM
##D plot(pM)
##D plot(pM, line.at = 0.8, model = c("emax", "linear"), summ = "mean")
##D plot(pM, line.at = 0.8, model = "none", summ = c("median", "min"))
## End(Not run)



