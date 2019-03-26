library(miWQS)


### Name: plot.wqs
### Title: Histograms of the Weights, Beta1, and WQS using 'ggplot2'
### Aliases: plot.wqs
### Keywords: wqs

### ** Examples

#Use simulated dataset and set seed for reproducibility.
data(simdata87)
set.seed(23456)
Wa <- estimate.wqs( y = simdata87$y.scenario, X = simdata87$X.true[ , 1:9],
                  B = 10, family = "binomial")
plot(Wa, filename = file.path(tempdir(), "WQS_Plot"))



