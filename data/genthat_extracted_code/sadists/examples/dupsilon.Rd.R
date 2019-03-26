library(sadists)


### Name: upsilon
### Title: The upsilon distribution.
### Aliases: dupsilon pupsilon qupsilon rupsilon upsilon
### Keywords: distribution

### ** Examples

mydf <- c(100,30,50)
myt <- c(-1,3,5)
rv <- rupsilon(500, df=mydf, t=myt)
d1 <- dupsilon(rv, df=mydf, t=myt)
## Not run: 
##D plot(rv,d1)
## End(Not run)
p1 <- pupsilon(rv, df=mydf, t=myt)
# should be nearly uniform:
## Not run: 
##D plot(ecdf(p1))
## End(Not run)
q1 <- qupsilon(ppoints(length(rv)),df=mydf,t=myt)
## Not run: 
##D qqplot(x=rv,y=q1)
## End(Not run)
## Not run: 
##D require(SharpeR)
##D ope <- 252
##D n.sim <- 500
##D n.term <- 3
##D set.seed(234234)
##D pp <- replicate(n.sim,{
##D   # these are population parameters 
##D   a <- rnorm(n.term) 
##D   psi <- 6 * rnorm(length(a)) / sqrt(ope)
##D   b <- sum(a * psi)
##D   df <- 100 + ceiling(200 * runif(length(psi)))
##D   comm <- 1 / sqrt(sum(a^2 / df))
##D   cdf <- df - 1
##D   # now independent draws from the SR distribution:
##D   x <- rsr(length(df), df, zeta=psi, ope=1)
##D   # now compute a p-value under the true null
##D   pupsilon(comm * b,df=cdf,t=comm*a*x) 
##D   })
##D # ought to be uniform:
##D plot(ecdf(pp)) 
## End(Not run)



