library(np)


### Name: npdeneqtest
### Title: Kernel Consistent Density Equality Test with Mixed Data Types
### Aliases: npdeneqtest
### Keywords: nonparametric

### ** Examples

## Not run: 
##D set.seed(1234)
##D 
##D ## Distributions are equal
##D 
##D n <- 250
##D 
##D sample.A <- data.frame(x=rnorm(n))
##D sample.B <- data.frame(x=rnorm(n))
##D 
##D npdeneqtest(sample.A,sample.B,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Distributions are unequal
##D 
##D sample.A <- data.frame(x=rnorm(n))
##D sample.B <- data.frame(x=rchisq(n,df=5))
##D 
##D npdeneqtest(sample.A,sample.B,boot.num=99)
##D 
##D ## Mixed datatypes, distributions are equal
##D 
##D sample.A <- data.frame(a=rnorm(n),b=factor(rbinom(n,2,.5)))
##D sample.B <- data.frame(a=rnorm(n),b=factor(rbinom(n,2,.5)))
##D 
##D npdeneqtest(sample.A,sample.B,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Mixed datatypes, distributions are unequal
##D 
##D sample.A <- data.frame(a=rnorm(n),b=factor(rbinom(n,2,.5)))
##D sample.B <- data.frame(a=rnorm(n,sd=10),b=factor(rbinom(n,2,.25)))
##D 
##D npdeneqtest(sample.A,sample.B,boot.num=99)
## End(Not run) 



