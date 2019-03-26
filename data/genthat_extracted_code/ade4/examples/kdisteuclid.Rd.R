library(ade4)


### Name: kdisteuclid
### Title: a way to obtain Euclidean distance matrices
### Aliases: kdisteuclid
### Keywords: multivariate utilities

### ** Examples

w <- c(0.8, 0.8, 0.377350269, 0.8, 0.377350269, 0.377350269) # see ref.
w <- kdist(w)
w1 <- c(kdisteuclid(kdist(w), "lingoes"), kdisteuclid(kdist(w), "cailliez"), 
  kdisteuclid(kdist(w), "quasi"))
print(w, print = TRUE)
print(w1, print = TRUE)

data(eurodist)
par(mfrow = c(1, 3))
eu1 <- kdist(eurodist) # an object of class 'dist'
plot(data.frame(unclass(c(eu1, kdisteuclid(eu1, "quasi")))), asp = 1)
title(main = "Quasi")
abline(0,1)
plot(data.frame(unclass(c(eu1, kdisteuclid(eu1, "lingoes")))), asp = 1)
title(main = "Lingoes")
abline(0,1)
plot(data.frame(unclass(c(eu1, kdisteuclid(eu1, "cailliez")))), asp = 1)
title(main = "Cailliez")
abline(0,1)



