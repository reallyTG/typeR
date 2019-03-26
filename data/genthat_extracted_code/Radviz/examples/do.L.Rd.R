library(Radviz)


### Name: do.L
### Title: Perform L-Normalization on a Vector
### Aliases: do.L

### ** Examples

data(iris)
mat <- iris[,c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')]
scaled <- apply(mat,2,do.L)
summary(scaled) # all values are between [0,1]

scaled2 <- apply(mat,2,do.L,fun=function(x) quantile(x,c(0.025,0.975)))
summary(scaled2) # all values are between [0,1]

plot(scaled,scaled2,
     col=rep(seq(1,ncol(scaled)),each=nrow(scaled)),
     pch=16)
legend('topleft',legend=dimnames(scaled)[[2]],col=seq(1,ncol(scaled)),pch=16,bty='n')




