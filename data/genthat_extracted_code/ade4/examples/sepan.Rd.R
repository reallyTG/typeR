library(ade4)


### Name: sepan
### Title: Separated Analyses in a K-tables
### Aliases: sepan plot.sepan print.sepan summary.sepan
### Keywords: multivariate

### ** Examples

data(escopage)
w <- data.frame(scale(escopage$tab))
w <- ktab.data.frame(w, escopage$blo, tabnames = escopage$tab.names)
sep1 <- sepan(w)
sep1
summary(sep1)
plot(sep1)



