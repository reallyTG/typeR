library(EnviroPRA)


### Name: random_number_generator
### Title: Random number generator
### Aliases: random_number_generator
### Keywords: methods

### ** Examples


set.seed(123)
a <- rnorm(n = 100, mean = 10, sd = 1)
Fit <- Fit_dist_parameter(a)

b <-random_number_generator(n = 10000, Fited = Fit, 
                            dist = "norm", a =8, b = 12)

par(mfrow=c(2,1))

hist(a,xlim= c(7,14))
hist(b,xlim= c(7,14))



