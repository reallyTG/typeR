library(compute.es)


### Name: compute.es-package
### Title: Compute Effect Sizes in R
### Aliases: compute.es-package
### Keywords: package

### ** Examples
 

## 1. Computations to Calculate Effect Sizes:
 
# For example, suppose the primary study reported a t-test 
# value for differences between 2 groups. Then, running:

tes(t=1.74, n.1=30, n.2=31)

# Or, more simply:

tes(1.74, 30, 31)  

# where the reported t-value = 1.74, treatment sample 
# size = 30, and the control/comparison sample size = 31 will
# output effect sizes of d, g, r, z, OR, and log odds ratio. 
# The variances, confidence intervals, p-values and other 
# statistics will also be computed.
# Note: If only the total sample size is reported simply split 
# the number in half for entry into the function. 

# Now suppose one has a dataset (i.e., data.frame in R-speak)
# with several t-values to be converted into effect sizes:

# First, we will generate sample data:

dat <- data.frame(id=1:5,t=rnorm(5, 2, .5), 
                  n.t=round(rnorm(5, 25),0), 
                  n.c=round(rnorm(5, 25),0))

# Running the fuction as follows will generate a new 
# data.frame with several effect size estimates

tes(t=t, n.1=n.t, n.2=n.c, level=95, dig=2, id=id, data=dat)




