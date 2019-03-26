library(spatstat)


### Name: pppdist
### Title: Distance Between Two Point Patterns
### Aliases: pppdist
### Keywords: spatial math

### ** Examples

# equal cardinalities
set.seed(140627)
X <- runifpoint(500)
Y <- runifpoint(500)
m <- pppdist(X, Y)
m
## Not run: 
##D plot(m)
## End(Not run)
  
# differing cardinalities
X <- runifpoint(14)
Y <- runifpoint(10)
m1 <- pppdist(X, Y, type="spa")
m2 <- pppdist(X, Y, type="ace")
m3 <- pppdist(X, Y, type="mat", auction=FALSE)
summary(m1)
summary(m2)
summary(m3)
## Not run: 
##D m1$matrix
##D m2$matrix
##D m3$matrix
## End(Not run)

# q = Inf
X <- runifpoint(10)
Y <- runifpoint(10)
mx1 <- pppdist(X, Y, q=Inf, matching=FALSE)
mx2 <- pppdist(X, Y, q=Inf, matching=FALSE, ccode=FALSE, approximation=50)
mx3 <- pppdist(X, Y, q=Inf, matching=FALSE, approximation=Inf)
all.equal(mx1,mx2,mx3)
# sometimes TRUE
all.equal(mx2,mx3)
# very often TRUE



