library(car)


### Name: logit
### Title: Logit Transformation
### Aliases: logit
### Keywords: manip

### ** Examples

options(digits=4)
logit(.1*0:10)
##  [1] -3.6636 -1.9924 -1.2950 -0.8001 -0.3847  0.0000  0.3847
##  [8]  0.8001  1.2950  1.9924  3.6636
## Warning message: 
## proportions remapped to (0.025, 0.975) in: logit(0.1 * 0:10) 

logit(.1*0:10, adjust=0)
##  [1]    -Inf -2.1972 -1.3863 -0.8473 -0.4055  0.0000  0.4055
##  [8]  0.8473  1.3863  2.1972     Inf



