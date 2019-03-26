library(VGAM)


### Name: confintvglm
### Title: Confidence Intervals for Parameters of VGLMs
### Aliases: confintvglm confintrrvglm confintvgam
### Keywords: models regression

### ** Examples

# Example 1: this is based on a glm example
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3, 1, 9); treatment <- gl(3, 3)
 glm.D93 <-  glm(counts ~ outcome + treatment, family = poisson())
vglm.D93 <- vglm(counts ~ outcome + treatment, family = poissonff)
confint(glm.D93) # needs MASS to be present on the system
confint.default(glm.D93)  # based on asymptotic normality
confint(vglm.D93)
confint(vglm.D93) - confint(glm.D93)    # Should be all 0s
confint(vglm.D93) - confint.default(glm.D93)  # based on asympt. normality

# Example 2: simulated negative binomial data with multiple responses
ndata <- data.frame(x2 = runif(nn <- 100))
ndata <- transform(ndata, y1 = rnbinom(nn, mu = exp(3+x2), size = exp(1)),
                          y2 = rnbinom(nn, mu = exp(2-x2), size = exp(0)))
fit1 <- vglm(cbind(y1, y2) ~ x2, negbinomial, data = ndata, trace = TRUE)
coef(fit1)
coef(fit1, matrix = TRUE)
confint(fit1)
confint(fit1, "x2:1")  #  This might be improved to "x2" some day...
## Not run: 
##D confint(fit1, method = "profile")  # Computationally expensive
##D confint(fit1, "x2:1", method = "profile", trace = FALSE)
## End(Not run)

fit2 <- rrvglm(y1 ~ x2, negbinomial(zero = NULL), data = ndata)
confint(as(fit2, "vglm"))  # Too narrow (SEs are biased downwards)



