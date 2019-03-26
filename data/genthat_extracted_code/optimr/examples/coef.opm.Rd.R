library(optimr)


### Name: coef.opm
### Title: Summarize opm object
### Aliases: coef.opm coef<-.opm coef<-
### Keywords: nonlinear optimize

### ** Examples

ans <- opm(fn = function(x) sum(x*x), par = 1:2, method="ALL", control=list(trace=1))
coef(ans)

## Not run: 
##D proj <- function(x) x/sum(x)
##D f <- function(x) -prod(proj(x))
##D ans <- opm(1:2, f)
##D ans
##D coef(ans) <- apply(coef(ans), 1, proj)
##D ans
## End(Not run)




