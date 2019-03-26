library(msme)


### Name: rwm5yr
### Title: German health registry for the years 1984-1988
### Aliases: rwm5yr
### Keywords: datasets

### ** Examples

data(rwm5yr)

glmrp <- glm(docvis ~ outwork + female + age + factor(edlevel),
             family = poisson, data = rwm5yr)
summary(glmrp)
exp(coef(glmrp))

ml_p <- ml_glm(docvis ~ outwork + female + age + factor(edlevel),
               family = "poisson",
               link = "log",
               data = rwm5yr)
summary(ml_p)
exp(coef(ml_p))


library(MASS)
glmrnb <- glm.nb(docvis ~ outwork + female + age + factor(edlevel),
                 data = rwm5yr)
summary(glmrnb)
exp(coef(glmrnb))
## Not run: 
##D library(gee)
##D mygee <- gee(docvis ~ outwork + age + factor(edlevel), id=id, 
##D   corstr = "exchangeable", family=poisson, data=rwm5yr)
##D summary(mygee)
##D exp(coef(mygee))
## End(Not run)



