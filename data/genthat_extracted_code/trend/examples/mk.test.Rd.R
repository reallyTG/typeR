library(trend)


### Name: mk.test
### Title: Mann-Kendall Trend Test
### Aliases: mk.test
### Keywords: nonparametric ts univar

### ** Examples

data(Nile)
mk.test(Nile, continuity = TRUE)

##
n <- length(Nile)
cor.test(x=(1:n),y=Nile, meth="kendall", continuity = TRUE)




