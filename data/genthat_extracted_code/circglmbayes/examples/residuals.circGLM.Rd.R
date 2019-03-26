library(circglmbayes)


### Name: residuals.circGLM
### Title: Obtain residuals from a circGLM object
### Aliases: residuals.circGLM

### ** Examples

m <- circGLM(th = rvmc(10, 0, 1))
residuals(m)

# Cosine residuals
residuals(m, type = "cosine")




