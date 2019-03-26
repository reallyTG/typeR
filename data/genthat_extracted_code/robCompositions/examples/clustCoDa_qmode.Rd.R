library(robCompositions)


### Name: clustCoDa_qmode
### Title: Q-mode cluster analysis for compositional parts
### Aliases: clustCoDa_qmode plot.clustCoDa_qmode
### Keywords: multivariate

### ** Examples

data(expenditures) 
x <- expenditures
cl <- clustCoDa_qmode(x)
plot(cl)
cl2 <- clustCoDa_qmode(x, method = "single")
plot(cl2)



