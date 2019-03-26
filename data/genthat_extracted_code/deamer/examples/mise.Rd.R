library(deamer)


### Name: mise
### Title: Mean integrated squared error
### Aliases: mise

### ** Examples


 n=1000
 x <- rchisq(n, df=3)
 e <- rnorm(n,0,0.1)
 y <- x + e
 estimate <- deamerKE(y, noise.type="gaussian", sigma=0.1)
 f_th <- function(x) dchisq(x, df=3)
 
 mise(f_th, estimate)
 



