library(flam)


### Name: summary.flam
### Title: Summarizes a Call to 'flam'
### Aliases: summary.flam plot.flamSparsity

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data
set.seed(1)
data <- sim.data(n = 50, scenario = 1, zerof = 10, noise = 1)
#fit model for a range of tuning parameters
flam.out <- flam(x = data$x, y = data$y, alpha.seq = c(0.8, 0.9, 1))

#summarize all of the fits (in particular, the percent sparsity achieved)
#note: percent sparsity is the percentage of features estimated to have 
#no relationship with outcome
summary(flam.out)
#the percent sparsity over the range of tuning parameters can also 
#be displayed in a plot
plot(summary(flam.out))

#we can also summarize the fit with a specific index, e.g. 25
#that is, lambda and alpha of
flam.out$all.lambda[25]; flam.out$all.alpha[25]
summary(flam.out, index = 25)



