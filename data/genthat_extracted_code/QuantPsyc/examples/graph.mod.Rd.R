library(QuantPsyc)


### Name: graph.mod
### Title: Moderation Graph
### Aliases: graph.mod
### Keywords: models

### ** Examples

data(tra)
lm.mod1 <- moderate.lm(beliefs, values, attitudes, tra)
ss.mod1 <- sim.slopes(lm.mod1, tra$values)
## requires user interaction 
## graph.mod(ss.mod1,beliefs,attitudes,tra,"Interaction Example")



