library(circglmbayes)


### Name: IC_compare.circGLM
### Title: Compare the information criteria of several circGLM models.
### Aliases: IC_compare.circGLM

### ** Examples

Xcat <- c(rep(0, 5), rep(1, 5))
th <- rvmc(10, 0, 4) + Xcat

# Compare a model that includes group differences with a model that does not.
IC_compare.circGLM(circGLM(th = th), circGLM(th = th, X = Xcat))



