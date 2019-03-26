library(symmoments)


### Name: symmomentsv2-package
### Title: Symbolically compute and numerically evaluate multivariate
###   central moments
### Aliases: ' symmomentsv2-package' ' symmomentsv2'

### ** Examples

# Compute the moment for the 4-dimensional moment c(1,2,3,4):
callmultmoments(c(1,2,3,4)) 

# Print the representation of the 4-dimensional moment c(1,2,3,4):
print(callmultmoments(c(1,2,3,4))) 

# Compute the LaTeX representation of the central moment c(1,2,3,4):
toLatex(callmultmoments(c(1,2,3,4)))

# Write the LaTeX representation to a file using the standard R function (not run):
# writeLines(callmultmoments(c(1,2,3,4))),con="yourfilename", sep = "\n")

# evaluate the moment c(1,2,3,4) at the following variance-covariance matrix
  #  4 2 1 1
  #  2 3 1 1
  #  1 1 2 1

evaluate(callmultmoments(c(1,2,3,4)),c(4,2,1,1,3,1,1,2,1,2))

# Using 10000 samples, estimate the central moment for c(2,4) at the covariance matrix (not run)
#  2 1
#  1 4

# and mean (0,0)
library(mvtnorm)
simulate(callmultmoments(c(2,4)),10000,NULL,c(0,0),c(2,1,1,4))

# Compute Latex representation of a non-central moment
# as.matrix(toLatex_noncentral(c(1,3))) 

# Create all 2-dimensional moment objects with exponents up to 3 
# First create the symmoments environment if it does not exist
# symmoments <- new.env()
# make.all.moments(c(3,3))

# Evaluate a non-central moment at a specified mean and covariance matrix
# Note that this invocation requires moments of order up to c(1,3)
# to exist in environment symmoments.
# evaluate_noncentral(c(1,3),c(1,2),c(1,0,1))

# Create an mpoly object 
library(mpoly)
t0 <- mpoly(list(c(coef=3,x1=2),c(coef=2,x1=1,x2=3),
                   c(coef=-4,z=2),c(coef=1,x1=1,x2=2,z=1)))  
                     
# Convert an mpolyobject to a moment object
t1 <<- convert.mpoly(t0)      

# Convert a moment object to a multipol object
t2 <<- convert.multipol(t1)

# Convert from multipol back to mpoly through moment

mpoly(convert.mpoly(convert.multipol(t2)))     

# Evaluate the expected value of a multivariate polynomial
# Required moments must exist in environment symmoments.

# evaluate_expected.polynomial(t0,c(1,2,3),c(1,0,0,1,0,1))

# Create a Newick representation of a tree
exam.Newick      <- "(((a,b),c),d);"

# Convert to phylo format
library(ape)
exam.phylo       <- read.tree(text=exam.Newick)

# Convert to matching format
exam.matching    <- as.matching(exam.phylo)

# Convert to L-matrix format
exam.L.matrix    <- toMoment(exam.matching)






