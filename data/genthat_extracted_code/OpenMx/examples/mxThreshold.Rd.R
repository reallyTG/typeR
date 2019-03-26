library(OpenMx)


### Name: mxThreshold
### Title: Create List of Thresholds
### Aliases: mxThreshold MxThreshold-class print,MxThreshold-method
###   show,MxThreshold-method $,MxThreshold-method $<-,MxThreshold-method

### ** Examples

library(OpenMx)
# threshold objects for three variables: 2 binary, and one ordinal.
mxThreshold(vars = c("z1", "z2", "z3"), nThresh = c(1,1,2),
  free = TRUE, values = c(-1, 0, -.5, 1.2) )



