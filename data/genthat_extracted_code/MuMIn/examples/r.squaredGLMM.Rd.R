library(MuMIn)


### Name: r.squaredGLMM
### Title: Pseudo-R-squared for Generalized Mixed-Effect models
### Aliases: r.squaredGLMM r.squaredGLMM.merMod
### Keywords: models

### ** Examples


## Don't show: 
 if(require(nlme)) {   
## End(Don't show)
data(Orthodont, package = "nlme")

fm1 <- lme(distance ~ Sex * age, ~ 1 | Subject, data = Orthodont)

fmnull <- lme(distance ~ 1, ~ 1 | Subject, data = Orthodont)

r.squaredGLMM(fm1)
r.squaredGLMM(fm1, fmnull)
r.squaredGLMM(update(fm1, . ~ Sex), fmnull)

r.squaredLR(fm1)
r.squaredLR(fm1, null.RE = TRUE)
r.squaredLR(fm1, fmnull) # same result

## Not run: 
##D if(require(MASS)) {
##D     fm <- glmmPQL(y ~ trt + I(week > 2), random = ~ 1 | ID, 
##D         family = binomial, data = bacteria, verbose = FALSE)
##D     fmnull <- update(fm, . ~ 1)
##D     r.squaredGLMM(fm)
##D 
##D     # Include R2GLMM (delta method estimates) in a model selection table:
##D     # Note the use of a common null model
##D     dredge(fm, extra = list(R2 = function(x) r.squaredGLMM(x, fmnull)["delta", ]))
##D     
##D }
## End(Not run)
## Don't show: 
  }  
## End(Don't show)



