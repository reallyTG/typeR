library(itsadug)


### Name: get_random
### Title: Get coefficients for the random intercepts and random slopes.
### Aliases: get_random

### ** Examples

data(simdat)

## Not run: 
##D # Condition as factor, to have a random intercept
##D # for illustration purposes:
##D simdat$Condition <- as.factor(simdat$Condition)
##D 
##D # Model with random effect and interactions:
##D m2 <- bam(Y ~ s(Time) + s(Trial)
##D + ti(Time, Trial)
##D + s(Condition, bs='re')
##D + s(Time, Subject, bs='re'),
##D data=simdat)
##D 
##D # extract all random effects combined:
##D newd <- get_random(m2)
##D head(newd)
##D 
##D # extract coefficients for the random intercept for Condition:
##D # Make bar plot:
##D barplot(newd[[1]])
##D abline(h=0)
##D 
##D # or select:
##D get_random(m2, cond=list(Condition=c('2','3')))
## End(Not run)




