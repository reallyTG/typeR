library(repeated)


### Name: nbkal
### Title: Negative Binomial Models with Kalman Update
### Aliases: nbkal print.nbkal
### Keywords: models

### ** Examples


y <- matrix(rnbinom(20,5,0.5), ncol=5)
times <- matrix(rep(seq(10,50,by=10),4), ncol=5, byrow=TRUE)
y0 <- matrix(rep(rnbinom(5,5,0.5),4), ncol=5, byrow=TRUE)
mu <- function(p) p[1]*log(y0)+(times<30)*p[2]*
	(times-30)+(times>30)*p[3]*(times-30)
nbkal(y, preg=c(1.3,0.008,-0.05), times=times, pdep=1.2, mu=mu)




