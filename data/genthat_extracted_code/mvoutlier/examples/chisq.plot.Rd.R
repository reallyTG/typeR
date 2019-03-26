library(mvoutlier)


### Name: chisq.plot
### Title: Chi-Square Plot
### Aliases: chisq.plot
### Keywords: dplot

### ** Examples

data(humus)
res <-chisq.plot(log(humus[,c("Co","Cu","Ni")]))
res$outliers # these are the potential outliers



