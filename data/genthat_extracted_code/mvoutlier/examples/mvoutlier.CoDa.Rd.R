library(mvoutlier)


### Name: mvoutlier.CoDa
### Title: Interpreting multivatiate outliers of CoDa
### Aliases: mvoutlier.CoDa
### Keywords: multivariate robust

### ** Examples

data(humus)
d <- humus[,c("As","Cd","Co","Cu","Mg","Pb","Zn")]
res <- mvoutlier.CoDa(d)
str(res)



