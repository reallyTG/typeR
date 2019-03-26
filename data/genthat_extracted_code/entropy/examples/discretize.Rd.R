library(entropy)


### Name: discretize
### Title: Discretize Continuous Random Variables
### Aliases: discretize discretize2d
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")

### 1D example ####

# sample from continuous uniform distribution
x1 = runif(10000)
hist(x1, xlim=c(0,1), freq=FALSE)

# discretize into 10 categories
y1 = discretize(x1, numBins=10, r=c(0,1))
y1

# compute entropy from counts
entropy(y1) # empirical estimate near theoretical maximum
log(10) # theoretical value for discrete uniform distribution with 10 bins 

# sample from a non-uniform distribution 
x2 = rbeta(10000, 750, 250)
hist(x2, xlim=c(0,1), freq=FALSE)

# discretize into 10 categories and estimate entropy
y2 = discretize(x2, numBins=10, r=c(0,1))
y2
entropy(y2) # almost zero

### 2D example ####

# two independent random variables
x1 = runif(10000)
x2 = runif(10000)

y2d = discretize2d(x1, x2, numBins1=10, numBins2=10)
sum(y2d)

# joint entropy
H12 = entropy(y2d )
H12
log(100) # theoretical maximum for 10x10 table

# mutual information
mi.empirical(y2d) # approximately zero


# another way to compute mutual information

# compute marginal entropies
H1 = entropy(rowSums(y2d))
H2 = entropy(colSums(y2d))

H1+H2-H12 # mutual entropy




