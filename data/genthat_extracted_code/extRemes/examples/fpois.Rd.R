library(extRemes)


### Name: fpois
### Title: Fit Homogeneous Poisson to Data and Test Equality of Mean and
###   Variance
### Aliases: fpois fpois.default fpois.data.frame fpois.matrix fpois.list
### Keywords: htest univar

### ** Examples


data(Rsum)
fpois(Rsum$Ct)

## Not run: 
##D 
##D # Because 'Rsum' is a data frame object,
##D # the above can also be carried out as:
##D 
##D fpois(Rsum, which.col = 3)
##D 
##D # Or:
##D 
##D fpois(Rsum, which.col = "Ct")
##D 
##D ##
##D ## For a non-homogeneous fit, use glm.
##D ##
##D ## For example, to fit the non-homogeneous Poisson model
##D ## Enso as a covariate:
##D ##
##D 
##D fit <- glm(Ct~EN, data = Rsum, family = poisson())
##D summary(fit)
## End(Not run)




