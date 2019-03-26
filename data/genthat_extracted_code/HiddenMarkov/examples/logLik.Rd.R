library(HiddenMarkov)


### Name: logLik
### Title: Log Likelihood of Hidden Markov Model
### Aliases: logLik logLik.dthmm logLik.mmglm0 logLik.mmglm1
###   logLik.mmglmlong1 logLik.mmpp
### Keywords: methods

### ** Examples

Pi <- matrix(c(1/2, 1/2,   0,
               1/3, 1/3, 1/3,
                 0, 1/2, 1/2),
             byrow=TRUE, nrow=3)

x <- dthmm(NULL, Pi, c(0,1,0), "norm",
           list(mean=c(1, 6, 3), sd=c(1, 0.5, 1)))

x <- simulate(x, nsim=100)

print(logLik(x))



