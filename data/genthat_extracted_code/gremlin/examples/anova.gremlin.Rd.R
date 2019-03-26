library(gremlin)


### Name: anova.gremlin
### Title: anova() for gremlin objects
### Aliases: anova.gremlin

### ** Examples

mod11 <- gremlinR(WWG11 ~ sex - 1,
random = ~ calf,
data = Mrode11,
Gstart = matrix(0.1), Rstart = matrix(0.4),
maxit = 50, v = 2, algit = "EM")
logLik(mod11)



