library(sfsmisc)


### Name: uniqueL
### Title: A Reversable Version of unique()
### Aliases: uniqueL
### Keywords: utilities

### ** Examples

 x0 <- c(1:3,2:7,8:4)
 str(r0 <- uniqueL(x0))
 with(r0, xU[ix]) ## == x0 !
## Don't show: 
 for(n in 1:100) {
   x0 <- round((1+rpois(1,lam=1))*rnorm(40))
   r0 <- uniqueL(x0)
   stopifnot(sort(unique(x0)) == r0$xU,
	     with(r0, xU[ix]) == x0)
 }
## End(Don't show)



