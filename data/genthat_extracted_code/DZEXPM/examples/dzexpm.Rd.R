library(DZEXPM)


### Name: dzexpm
### Title: The estimation and prediction function for the skewed spatial
###   processes
### Aliases: dzexpm

### ** Examples

  real<- as.matrix(do.call(cbind, MaxTemp03))
  n_ful<- nrow(real)
  y_ful<- real[,2]
  x_ful<- real[,7]
  x_ful<- log(x_ful)
  x_ful<- scale(x_ful)
  u1<- real[,3]
  u2<- real[,4]
  theta<- 2/150000
  n<- 56
  p<- 0.1
 dzexpm(y_ful, x_ful, n_ful, n, u1, u2, theta, p, 50, 20)



