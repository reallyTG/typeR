library(lme4)


### Name: glmer.nb
### Title: Fitting Negative Binomial GLMMs
### Aliases: glmer.nb negative.binomial
### Keywords: models

### ** Examples

set.seed(101)
dd <- expand.grid(f1 = factor(1:3),
                  f2 = LETTERS[1:2], g=1:9, rep=1:15,
          KEEP.OUT.ATTRS=FALSE)
summary(mu <- 5*(-4 + with(dd, as.integer(f1) + 4*as.numeric(f2))))
dd$y <- rnbinom(nrow(dd), mu = mu, size = 0.5)
str(dd)
require("MASS")## and use its glm.nb() - as indeed we have zero random effect:
## Not run: 
##D m.glm <- glm.nb(y ~ f1*f2, data=dd, trace=TRUE)
##D summary(m.glm)
##D m.nb <- glmer.nb(y ~ f1*f2 + (1|g), data=dd, verbose=TRUE)
##D m.nb
##D ## The neg.binomial theta parameter:
##D getME(m.nb, "glmer.nb.theta")
##D LL <- logLik(m.nb)
##D ## mixed model has 1 additional parameter (RE variance)
##D stopifnot(attr(LL,"df")==attr(logLik(m.glm),"df")+1)
##D plot(m.nb, resid(.) ~ g)# works, as long as data 'dd' is found
## End(Not run)



