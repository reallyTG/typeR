library(dimRed)


### Name: HLLE-class
### Title: Hessian Locally Linear Embedding
### Aliases: HLLE-class HLLE

### ** Examples

dat <- loadDataSet("3D S Curve", n = 1500)

## directy use the S4 class:
hlle <- HLLE()
emb <- hlle@fun(dat, hlle@stdpars)

## using embed():
emb2 <- embed(dat, "HLLE", knn = 45)

plot(emb, type = "2vars")
plot(emb2, type = "2vars")




