library(ebGenotyping)


### Name: my.bisec
### Title: Bisection method to find the root
### Aliases: my.bisec

### ** Examples

f <- function(x){
a <- 1:10
return(x-a)
}
my.bisec(f=f, int.l=rep(-1,10), int.u=rep(11,10), eps = 1e-08)



