library(VGAMextra)


### Name: expMeanlink
### Title: Link functions for the mean of 1-parameter continuous
###   distributions: The exponential distribution.
### Aliases: expMeanlink

### ** Examples

 ##  E1. Modelling the mean of the exponential distribution  ##
    set.seed(17010402)
    nn <- 100
    edata <- data.frame(x2 = runif(nn) - 0.5, x3 = runif(nn) - 0.5)
    edata <- transform(edata, eta = 0.2 - 0.7 * x2 + 1.9 * x3)
    
            #----- The mean is a function of 'x2' and 'x3' ------#
    edata <- transform(edata, rate = expMeanlink(eta, inverse = TRUE))
    
    edata <- transform(edata, y = rexp(nn, rate = rate))
    with(edata, stem(y))
    with(edata, hist(y))

    exp.fit <- vglm(y ~ x2 + x3, exponential(link = "expMeanlink"), 
                    data = edata, zero = NULL, trace = TRUE, crit = "log")
   coef(exp.fit, matrix = TRUE)
   summary(exp.fit)
 
 ## E2. expMeanlink() and its inverse ##
    theta <- 0.1 + 1:5
    location <- 1.5
    my.diff <- theta - expMeanlink(expMeanlink(theta = theta, 
                  location = location), location = location, inverse  =TRUE)
    summary(my.diff)     # Zero


  ## E3. Special values in a matrix ##
    theta <- matrix(c(Inf, -Inf, NA, NaN, 1 , 2), ncol = 3, nrow = 2)
    expMeanlink(theta = theta, location = location)



