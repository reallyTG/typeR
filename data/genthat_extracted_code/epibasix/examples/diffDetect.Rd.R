library(epibasix)


### Name: diffDetect
### Title: Mean Difference Detetion Tool
### Aliases: diffDetect 'Mean Difference' summary.diffDetect
###   print.diffDetect
### Keywords: design

### ** Examples

## Not run: 
##D Suppose, for financial considerations we can only enroll 100 people in a blood
##D pressure medication trial.  What is the minimum difference we can detect between means if 
##D sigma = 1, 5 or 10 mmHg, at standard levels?
## End(Not run)
n <- 100;
sigma <- c(1, 5, 10);
diffDetect(n,sigma);



