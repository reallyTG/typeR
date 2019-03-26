library(flam)


### Name: flamDOF
### Title: Calculate Degrees of Freedom for Fused Lasso Additive Model
### Aliases: flamDOF

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data
#note: use larger 'n' for more reasonable results
set.seed(1)
data <- sim.data(n = 20, scenario = 1, zerof = 10, noise = 1)

#fit model for a range of tuning parameters
flam.out <- flam(x = data$x, y = data$y)
#or fit model and select tuning parameters using 2-fold cross-validation
#note: use larger 'n.fold' (e.g., 10) in practice
flamCV.out <- flamCV(x = data$x, y = data$y, n.fold = 2)

#calculate degrees of freedom for the model chosen using cross-validation
flamDOF(object = flamCV.out$flam.out, index = flamCV.out$index.cv)
#or for any fit from a 'flam' object
flamDOF(object = flam.out, index = 25)
flamDOF(object = flamCV.out$flam.out, index = 25)
#which corresponds to lambda and alpha of
flam.out$all.lambda[25]; flam.out$all.alpha[25]



