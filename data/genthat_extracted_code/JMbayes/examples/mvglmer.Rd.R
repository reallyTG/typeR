library(JMbayes)


### Name: mvglmer
### Title: Multivariate Mixed Models
### Aliases: mvglmer
### Keywords: multivariate regression

### ** Examples


## Not run: 
##D MixedModelFit <- mvglmer(list(log(serBilir) ~ year + (year | id),
##D                                spiders ~ year + (1 | id)), data = pbc2,
##D                           families = list(gaussian, binomial))
##D 
##D summary(MixedModelFit)
##D plot(MixedModelFit)
## End(Not run)



