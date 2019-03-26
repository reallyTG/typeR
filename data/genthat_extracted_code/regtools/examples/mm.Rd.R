library(regtools)


### Name: mm
### Title: Method of Moments, Including Possible Regression Terms
### Aliases: mm

### ** Examples

x <- rgamma(1000,2)
m <- c(mean(x),var(x))
g <- function(x,theta) {  # from theoretical properties of gamma distr.
   g1 <-  theta[1] / theta[2]
   g2 <-  theta[1] / theta[2]^2
   c(g1,g2)
}
# should output about 2 and 1
mm(m,g,x)

## Not run: 
##D library(mfp)
##D data(bodyfat)
##D # model as a beta distribution 
##D g <- function(x,theta) {
##D    t1 <- theta[1]
##D    t2 <- theta[2]
##D    t12 <- t1 + t2
##D    meanb <- t1 / t12
##D    m1 <- meanb 
##D    m2 <- t1*t2 / (t12^2 * (t12+1)) 
##D    c(m1,m2)
##D }
##D x <- bodyfat$brozek/100
##D m <- c(mean(x),var(x))
##D # about 4.65 and 19.89
##D mm(m,g,x)
## End(Not run)




