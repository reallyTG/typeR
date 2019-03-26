library(surveillance)


### Name: algo.rogerson
### Title: Modified CUSUM method as proposed by Rogerson and Yamada (2004)
### Aliases: algo.rogerson
### Keywords: classif

### ** Examples

# simulate data
set.seed(123)
data <- simHHH(control = list(coefs = list(alpha =-0.5, gamma = 0.4,
               delta = 0.6)),length=300)

# extract mean used to generate the data
lambda <- data$endemic

# determine a matrix with h values
hVals <- hValues(theta0 = 10:150/100, ARL0=500, s = 1, distr = "poisson")

# apply modified Poisson CUSUM
res <- algo.rogerson(data$data,
            control=c(hVals, list(theta0t=lambda,range=1:300)))
plot(res)



