library(penalized)


### Name: Plotting the LASSO path
### Title: Plotting the LASSO path
### Aliases: plotpath
### Keywords: multivariate regression

### ** Examples


data(nki70)

# Fit the model with the steps argument and plot
pen <- penalized(Surv(time, event), penalized = nki70[,8:77],
    data = nki70, lambda1=1, steps = 20)

plotpath(pen)




