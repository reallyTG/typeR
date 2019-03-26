library(GEVStableGarch)


### Name: gsSelect
### Title: Selects the best model according to goodness-of-fit criteria
### Aliases: gsSelect

### ** Examples


# Best ARMA-GARCH model within the range ARMA(0,0)-GARCH(1,0) to ARMA(0,0)-GARCH(1,1)
# using the Corrected Akaike Information Criteria (AICc)
data(dem2gbp)
x = dem2gbp[,1]
model = gsSelect (data = x, order.max = c(0,0,1,1), is.aparch = FALSE, 
          algorithm = "sqp", cond.dist = "gev", selection.criteria = "AIC", 
          include.mean = FALSE)




