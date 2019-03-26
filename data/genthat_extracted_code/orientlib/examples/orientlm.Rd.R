library(orientlib)


### Name: orientlm
### Title: Linear models for orientation data
### Aliases: orientlm
### Keywords: regression

### ** Examples

x <- rep(1:10,10)
y <- rep(1:10,each=10)
A1 <- skewvector(cbind(x/10,y/10,rep(0,100)))
A2 <- skewvector(c(1,1,1))
trueorientation <- skewvector(matrix(rnorm(300),100))
noise <- skewvector(matrix(rnorm(300)/10,100))
obs <- t(A1) %*% trueorientation %*% A2 %*% noise

fit <- orientlm(obs, ~ x + y, trueorientation, ~ 1)

context <- boat3d(A1, x, z=y, col = 'green', graphics='scatterplot3d')
boat3d(fit$A1, x, z=y, add=context)



