library(BWStest)


### Name: murakami_stat
### Title: Compute Murakami's test statistic.
### Aliases: murakami_stat murakami_stat_perms

### ** Examples


set.seed(1234)
x <- runif(1000)
y <- runif(100)
bval <- murakami_stat(x,y,1)

## Not run: 
##D nx <- 6
##D ny <- 5
##D # monte carlo
##D set.seed(1234)
##D repli <- replicate(3000,murakami_stat(rnorm(nx),rnorm(ny),0L))
##D # under the null, perform the permutation test:
##D allem <- murakami_stat_perms(nx,ny,0L)
##D plot(ecdf(allem)) 
##D lines(ecdf(repli),col='red') 
## End(Not run)




