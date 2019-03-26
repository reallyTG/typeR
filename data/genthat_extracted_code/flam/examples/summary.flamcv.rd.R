library(flam)


### Name: summary.flamCV
### Title: Summarizes a Call to 'flamCV'
### Aliases: summary.flamCV

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data
set.seed(1)
data <- sim.data(n = 50, scenario = 1, zerof = 0, noise = 1)
#fit model and select tuning parameters using 2-fold cross-validation
#note: use larger 'n.fold' (e.g., 10) in practice
flamCV.out <- flamCV(x = data$x, y = data$y, n.fold = 2)

#we can summarize the cross-validation function call
summary(flamCV.out)
#lambda chosen by cross-validation is also available from
flamCV.out$lambda.cv



