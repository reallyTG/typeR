library(brlrmr)


### Name: il
### Title: il
### Aliases: il

### ** Examples

## Not run: 
##D #############################################
##D ########### Simulated Example ###############
##D #############################################
##D data(simulated.data)  # load simulated data
##D 
##D # parameter definition
##D beta0 <- 1
##D beta1 <- 1
##D beta2 <- 1
##D beta3 <- 1
##D beta4 <- 1
##D 
##D # parameter definition for missing indicator
##D alpha0 <- -1.1
##D alpha1 <- -1
##D alpha2 <- 1
##D alpha3 <- 1
##D alpha4 <- 1
##D alpha5 <- -1
##D 
##D parameter <- c(beta0, beta1, beta2, beta3, beta4,
##D                alpha0, alpha1, alpha2, alpha3, alpha4, alpha5)
##D 
##D il(y ~ x1 + x2 + x3 + x4, data = simulated.data, parameter,
##D family = binomial(link = "logit"), na.action = na.pass)
## End(Not run)

## Not run: 
##D #############################################
##D ##### Real data example with separation #####
##D #############################################
##D data(nhanes)  # load nhanes data
##D il(hyp ~ age2 + age3, data = nhanes, family = binomial(link = "logit"), na.action = na.pass)
##D # IL method encounters separation
## End(Not run)



