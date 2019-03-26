library(boot)


### Name: boot.array
### Title: Bootstrap Resampling Arrays
### Aliases: boot.array
### Keywords: nonparametric

### ** Examples

#  A frequency array for a nonparametric bootstrap
city.boot <- boot(city, corr, R = 40, stype = "w")
boot.array(city.boot)

perm.cor <- function(d,i) cor(d$x,d$u[i])
city.perm <- boot(city, perm.cor, R = 40, sim = "permutation")
boot.array(city.perm, indices = TRUE)



