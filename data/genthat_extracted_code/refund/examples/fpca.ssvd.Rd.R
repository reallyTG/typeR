library(refund)


### Name: fpca.ssvd
### Title: Smoothed FPCA via iterative penalized rank one SVDs.
### Aliases: fpca.ssvd

### ** Examples

 ## as in Sec. 6.2 of Huang, Shen, Buja (2008):
 set.seed(2678695)
 n <- 101
 m <- 101
 s1 <- 20
 s2 <- 10
 s <- 4
 t <- seq(-1, 1, l=m)
 v1 <- t + sin(pi*t)
 v2 <- cos(3*pi*t)
 V <- cbind(v1/sqrt(sum(v1^2)), v2/sqrt(sum(v2^2)))
 U <- matrix(rnorm(n*2), n, 2)
 D <- diag(c(s1^2, s2^2))
 eps <- matrix(rnorm(m*n, sd=s), n, m)
 Y <- U%*%D%*%t(V) + eps

smoothSV <- fpca.ssvd(Y, verbose=TRUE)

 layout(t(matrix(1:4, nr=2)))
 clrs <- sapply(rainbow(n), function(c)
           do.call(rgb, as.list(c(col2rgb(c)/255, .1))))
 matplot(V, type="l", lty=1, col=1:2, xlab="",
         main="FPCs: true", bty="n")
 matplot(smoothSV$efunctions, type="l", lty=1, col=1:5, xlab="",
         main="FPCs: estimate", bty="n")
 matplot(1:m, t(U%*%D%*%t(V)), type="l", lty=1, col=clrs, xlab="", ylab="",
         main="true smooth Y", bty="n")
 matplot(1:m, t(smoothSV$Yhat), xlab="", ylab="",
         type="l", lty=1,col=clrs, main="estimated smooth Y", bty="n")



