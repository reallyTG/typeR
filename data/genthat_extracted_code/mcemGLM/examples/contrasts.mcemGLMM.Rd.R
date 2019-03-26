library(mcemGLM)


### Name: contrasts.mcemGLMM
### Title: Contrast estimation for mcemGLMM objects
### Aliases: contrasts.mcemGLMM
### Keywords: glmm

### ** Examples

## No test: 
set.seed(72327)
data(exdata)
fit <- mcemGLMM(obs ~ z2 + x, random = ~ 0 + z1, 
                data = exdata, 
                family = "bernoulli", vcDist = "normal", 
                controlEM = list(verb = FALSE, EMit = 15, MCit = 10000), 
                initial = c(-0.13, -0.15, -0.21, 1.59, 0.002))
mat <- rbind("1 - 2" = c(0, -1, 0, 0), "1 - 3" = c(0, 0, -1, 0), "2 - 3" = c(0, 1, -1, 0))
contrasts.mcemGLMM(fit, mat)
## End(No test)



