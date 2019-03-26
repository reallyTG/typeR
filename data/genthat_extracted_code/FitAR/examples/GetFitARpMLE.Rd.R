library(FitAR)


### Name: GetFitARpMLE
### Title: Exact MLE for subset ARp Models
### Aliases: GetFitARpMLE
### Keywords: ts

### ** Examples

#Example 1. MLE works
z<-log(lynx)
p<-c(1,2,4,7,10,11)
GetFitARpMLE(z, p)
#
#Example 2. MLE fails with error.
p<-c(1,2,9,12)
## Not run: GetFitARpMLE(z, p)



