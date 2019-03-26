library(mcemGLM)


### Name: mcemGLMMext
### Title: Extending the Iterations of a Model Fitted with mcemGLMM
### Aliases: mcemGLMMext
### Keywords: glmm mcemGLMM

### ** Examples

## No test: 
set.seed(72327)
data(exdata)
fit1 <- mcemGLMM(obs ~ z2 + x, random = ~ 0 + z1, 
                 data = exdata, 
                 family = "bernoulli", vcDist = "normal", 
                 controlEM = list(verb = FALSE, EMit = 5, MCit = 8000), 
                 initial = c(-0.13, -0.15, -0.21, 1.59, 0.002))
                 
# Now we extend the algorithm to do at least another 10 iterations
fit2 <- mcemGLMMext(fit1, it = 10)
## End(No test)



