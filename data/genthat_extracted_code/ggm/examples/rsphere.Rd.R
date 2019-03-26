library(ggm)


### Name: rsphere
### Title: Random vectors on a sphere
### Aliases: rsphere
### Keywords: distribution multivariate

### ** Examples

## 100 points on circle
z <- rsphere(100,2)
plot(z)

## 100 points on a sphere
z <- rsphere(100, 3)
pairs(z)



