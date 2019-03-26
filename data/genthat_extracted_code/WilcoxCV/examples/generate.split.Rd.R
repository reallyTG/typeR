library(WilcoxCV)


### Name: generate.split
### Title: Generating random splittings into learning and test data sets
### Aliases: generate.split
### Keywords: htest

### ** Examples

# load WilcoxCV library
library(WilcoxCV)

# Generate 50 splits with ratio 2:1 for a data set including 90 observations
my.split<-generate.split(niter=50,n=90,ntest=30)



