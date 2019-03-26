library(optimx)


### Name: coef
### Title: Summarize opm object
### Aliases: coef<- coef.opm coef<-.opm coef.optimx coef<-.optimx
### Keywords: nonlinear optimize

### ** Examples

ans <- opm(fn = function(x) sum(x*x), par = 1:2, method="ALL", control=list(trace=0))
print(coef(ans))

ansx <- optimx(fn = function(x) sum(x*x), par = 1:2, control=list(all.methods=TRUE, trace=0))
print(coef(ansx))


## Not run: 
##D proj <- function(x) x/sum(x)
##D f <- function(x) -prod(proj(x))
##D ans <- opm(1:2, f)
##D print(ans)
##D coef(ans) <- apply(coef(ans), 1, proj)
##D print(ans)
## End(Not run)




