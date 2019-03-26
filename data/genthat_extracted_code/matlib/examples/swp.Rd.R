library(matlib)


### Name: swp
### Title: The Matrix Sweep Operator
### Aliases: swp

### ** Examples

data(therapy)
mod3 <- lm(therapy ~ perstest + IE + sex, data=therapy)
X <- model.matrix(mod3)
XY <- cbind(X, therapy=therapy$therapy)
XY
M <- crossprod(XY)
swp(M, 1)
swp(M, 1:2)



