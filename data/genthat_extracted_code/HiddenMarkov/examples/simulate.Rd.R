library(HiddenMarkov)


### Name: simulate
### Title: Simulate Hidden Markov Process
### Aliases: simulate simulate.dthmm simulate.mchain simulate.mmglm0
###   simulate.mmglm1 simulate.mmglmlong1 simulate.mmpp
### Keywords: methods datagen

### ** Examples

#    The hidden Markov chain has 5 states with transition matrix:

Pi <- matrix(c(1/2, 1/2,   0,   0,   0,
               1/3, 1/3, 1/3,   0,   0,
                 0, 1/3, 1/3, 1/3,   0,
                 0,   0, 1/3, 1/3, 1/3,
                 0,   0,   0, 1/2, 1/2),
             byrow=TRUE, nrow=5)

#--------------------------------------------
#   simulate a Poisson HMM

x <- dthmm(NULL, Pi, c(0, 1, 0, 0, 0), "pois",
           list(lambda=c(1, 4, 2, 5, 3)), discrete = TRUE)

x <- simulate(x, nsim=2000)

#    check Poisson means
for (i in 1:5) print(mean(x$x[x$y==i]))

#--------------------------------------------
#   simulate a Gaussian HMM

x <- dthmm(NULL, Pi, c(0, 1, 0, 0, 0), "norm",
           list(mean=c(1, 4, 2, 5, 3), sd=c(0.5, 1, 1, 0.5, 0.1)))

x <- simulate(x, nsim=2000)

#    check means and standard deviations
for (i in 1:5) print(mean(x$x[x$y==i]))
for (i in 1:5) print(sd(x$x[x$y==i]))



