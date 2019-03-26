library(VGAMextra)


### Name: rayleighMeanlink
### Title: Link functions for the mean of 1-parameter continuous
###   distributions: The Rayleigh and the Maxwell distributions.
### Aliases: rayleighMeanlink maxwellMeanlink

### ** Examples

 ##  The link and its inverse ##
    theta <- 0.1 + 1:10
    eta   <- maxwellMeanlink(maxwellMeanlink(theta = theta), inverse  =TRUE)
    summary(eta - theta)     # Zero
    
    eta   <- rayleighMeanlink(rayleighMeanlink(theta = theta), inverse  =TRUE)
    summary(eta - theta)     # Zero


 ## Modelling the mean of the Maxwell distribution  ##
    set.seed(17010401)
    
    rate <- maxwellMeanlink(theta = 2, inverse = TRUE)   # ~ 0.046
    mdata <- data.frame(y = rmaxwell(1000, rate = rate ))
    
    fit <- vglm(y ~ 1, maxwell(link = "maxwellMeanlink"), 
                data = mdata, trace = TRUE, crit = "coef")
    
    coef(fit, matrix = TRUE)
    Coef(fit)
 




