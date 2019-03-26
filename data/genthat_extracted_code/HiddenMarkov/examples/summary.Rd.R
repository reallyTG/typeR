library(HiddenMarkov)


### Name: summary
### Title: Summary of Hidden Markov Model
### Aliases: summary summary.dthmm summary.mmpp summary.mmglm0
###   summary.mmglm1 summary.mmglmlong1
### Keywords: methods

### ** Examples

Pi <- matrix(c(0.8, 0.2,
               0.3, 0.7),
             byrow=TRUE, nrow=2)

x <- dthmm(NULL, Pi, c(0, 1), "beta",
           list(shape1=c(2, 6), shape2=c(6, 2)))

x <- simulate(x, nsim=2000)

print(summary(x))



