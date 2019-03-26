library(NNLM)


### Name: predict.nnmf
### Title: Methods for nnmf object returned by 'nnmf'
### Aliases: predict.nnmf print.nnmf

### ** Examples


x <- matrix(runif(50*20), 50, 20)
r <- nnmf(x, 2)
r
newx <- matrix(runif(50*30), 50, 30)
pred <- predict(r, newx, 'H')




