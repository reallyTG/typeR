library(nsROC)


### Name: print
### Title: Print an ROC curve object
### Aliases: print.groc print.rocbands print.cdroc
### Keywords: print

### ** Examples

# Data generation
set.seed(123)
X <- c(rnorm(45), rnorm(30,2,1.5))
D <- c(rep(0,45), rep(1,30))

# Print a groc object
grocobj <- gROC(X,D)
print(grocobj)

# Print an rocbands object
grocobj <- ROCbands(grocobj)
print(grocobj)

# Print a cdroc object
set.seed(123)
stime <- rchisq(50,3)
status <- sample(c(rep(1,45), rep(0,5)))
marker <- max(stime) - stime + rnorm(50,0,2)
cdrocobj <- cdROC(stime, status, marker, 3, ci=TRUE)
print(cdrocobj)



