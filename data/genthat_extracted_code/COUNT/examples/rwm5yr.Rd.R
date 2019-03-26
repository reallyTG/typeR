library(COUNT)


### Name: rwm5yr
### Title: rwm5yr
### Aliases: rwm5yr
### Keywords: datasets

### ** Examples

library(MASS)
data(rwm5yr)

glmrp <- glm(docvis ~ outwork + female + age + factor(edlevel), family=poisson, data=rwm5yr)
summary(glmrp)
exp(coef(glmrp))

## Not run: 
##D library(msme)
##D nb2 <- nbinomial(docvis ~ outwork + female + age + factor(edlevel), data=rwm5yr)
##D summary(nb2)
##D exp(coef(nb2)) 
##D 
##D glmrnb <- glm.nb(docvis ~ outwork + female + age + factor(edlevel), data=rwm5yr)
##D summary(glmrnb)
##D exp(coef(glmrnb))
## End(Not run)



