library(SDT)


### Name: print.share
### Title: Print Method for Objects of Class share
### Aliases: print.share
### Keywords: methods print

### ** Examples

## attach dataset to search path (to use variable names)
attach(learning_motivation)

## internalization print
pidr <- print(internalization(identified, intrinsic, external))
## compactly displayed structure of the object pidr
str(pidr)

## simplex structure print
psimstr <- print(simplex(intrinsic, identified, introjected, external))
## compactly displayed structure of the object psimstr
str(psimstr)



