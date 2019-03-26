library(SDT)


### Name: internalization
### Title: Motivation Internalization or Externalization Shares
### Aliases: internalization
### Keywords: attribute classes models regression

### ** Examples

## attach dataset to search path (to use variable names)
attach(learning_motivation)

## internal share and external share of identified regulation
(idr <- internalization(identified, intrinsic, external))
## attribute value and class
attr(idr, "analysis")
class(idr)

## internal share and external share of introjected regulation
(ijr <- internalization(introjected, intrinsic, external))
## all attributes
attributes(ijr)



