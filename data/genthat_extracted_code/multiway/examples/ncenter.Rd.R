library(multiway)


### Name: ncenter
### Title: Center n-th Dimension of Array
### Aliases: ncenter
### Keywords: array algebra

### ** Examples

##########   EXAMPLE 1   ##########
X <- matrix(rnorm(2000),100,20)
Xc <- ncenter(X)          # center across rows
sum(colSums(Xc))
Xc <- ncenter(Xc,mode=2) # recenter across columns
sum(colSums(Xc)) 
sum(rowSums(Xc))


##########   EXAMPLE 2   ##########
X <- array(rnorm(20000),dim=c(100,20,10))
Xc <- ncenter(X,mode=2)   # center across columns
sum(rowSums(Xc))


##########   EXAMPLE 3   ##########
X <- array(rnorm(100000),dim=c(100,20,10,5))
Xc <- ncenter(X,mode=4)   # center across 4-th mode
sum(rowSums(Xc))


##########   EXAMPLE 4   ##########
X <- replicate(5,array(rnorm(20000),dim=c(100,20,10)),simplify=FALSE)
Xc <- ncenter(X)
sum(colSums(Xc[[1]]))




