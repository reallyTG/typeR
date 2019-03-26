library(ade4)


### Name: quasieuclid
### Title: Transformation of a distance matrice to a Euclidean one
### Aliases: quasieuclid
### Keywords: array

### ** Examples

data(yanomama)
geo <- as.dist(yanomama$geo)
is.euclid(geo) # FALSE
geo1 <- quasieuclid(geo)
is.euclid(geo1) # TRUE
par(mfrow = c(2,2))
lapply(yanomama, function(x) plot(as.dist(x), quasieuclid(as.dist(x))))

par(mfrow = c(1,1))


