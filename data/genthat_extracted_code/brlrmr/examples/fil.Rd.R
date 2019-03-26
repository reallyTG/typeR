library(brlrmr)


### Name: fil
### Title: fil
### Aliases: fil

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
##D fil(y ~ x1 + x2 + x3 + x4, data = simulated.data, parameter,
##D family = binomial(link = "logit"), na.action = na.pass)
## End(Not run)

#############################################
##### Real data example with separation #####
#############################################
data(nhanes)  # load nhanes data
fil(hyp ~ age2 + age3, data = nhanes, family = binomial(link = "logit"), na.action = na.pass)

data(incontinence)  # load nhanes data
fil(y ~ x1 + x2 + x3, data = incontinence, family = binomial(link = "logit"), na.action = na.pass)



