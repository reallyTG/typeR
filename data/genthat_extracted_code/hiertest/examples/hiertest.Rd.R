library(hiertest)


### Name: hiertest
### Title: Convex Hierarchical Testing Method
### Aliases: hiertest

### ** Examples

# generate some data accoring to the backward model:
set.seed(1)
n <- 200
p <- 50
y <- rep(0:1, each=n/2)
x <- matrix(rnorm(n*p), n, p)
colnames(x) <- c(letters,LETTERS)[1:p]
# make some interactions between several pairs of variables:
R <- matrix(0.3, 5, 5)
diag(R) <- 1
x[y==1, 1:5] <- x[y==1, 1:5] %*% R
# and a main effect for variables 1 and 3:
x[y==1, 1:5] <- x[y==1, 1:5] + 0.5
testobj <- hiertest(x=x, y=y, type="Fisher")
# look at test statistics
print(testobj)
plot(testobj)
## Not run: 
##D lamlist <- seq(5, 2, length=100)
##D estfdr <- estimate.fdr(x, y, lamlist, type="Fisher", B=200)
##D plot(estfdr)
##D print(estfdr)
##D # the cutoff lamlist[70] is estimated to have roughly 10% FDR:
##D estfdr$fdr[70]
##D # this allows us to reject this many interactions:
##D nrejected <- estfdr$ncalled[70]
##D # These are the interactions rejected:
##D interactions.above(testobj, lamlist[70])
## End(Not run)



