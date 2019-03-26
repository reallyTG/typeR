library(protoclass)


### Name: protoclass
### Title: Greedy algorithm for prototype selection
### Aliases: protoclass protoclass-package

### ** Examples

# generate some data:
set.seed(1)
n <- 200
p <- 2
x <- matrix(rnorm(n * p), n, p)
y <- rep(c("A","B"), each=n/2)
x[y=="A", ] <- x[y=="A", ] + 3
itr <- sample(n, n/2)
xtr <- x[itr, ] # train
ytr <- y[itr]
xte <- x[-itr, ] # test
yte <- y[-itr]

# take prototype candidates identical to training points:
z <- xtr
dxz <- dist2(xtr, z)
# run protoclass:
prot <- protoclass(dxz=dxz, y=ytr, eps=2, lambda=1/n)
## Not run: 
##D plot(prot,xtr,y=1+(ytr=="A"))
## End(Not run)
# get predictions on test data:
pred1 <- predict(prot, xte, z=xtr)
# get predictions on test data using pairwise distances:
pred2 <- predictwithd.protoclass(prot, dist2(xte, z))



