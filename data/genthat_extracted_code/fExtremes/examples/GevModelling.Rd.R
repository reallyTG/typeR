library(fExtremes)


### Name: GevModelling
### Title: Generalized Extreme Value Modelling
### Aliases: GevModelling fGEVFIT fGEVFIT-class show,fGEVFIT-method gevSim
###   gumbelSim gevFit gumbelFit plot.fGEVFIT summary.fGEVFIT
### Keywords: models

### ** Examples

## gevSim -
   # Simulate GEV Data, use default length n=1000
   x = gevSim(model = list(xi = 0.25, mu = 0 , beta = 1), n = 1000)
   head(x)

## gumbelSim -
   # Simulate GEV Data, use default length n=1000
   x = gumbelSim(model = list(xi = 0.25, mu = 0 , beta = 1))
     
## gevFit -
   # Fit GEV Data by Probability Weighted Moments:
   fit = gevFit(x, type = "pwm") 
   print(fit)
   
## summary -
   # Summarize Results:
   par(mfcol = c(2, 2))
   summary(fit)



