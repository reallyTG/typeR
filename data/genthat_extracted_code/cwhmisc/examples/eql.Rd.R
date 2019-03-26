library(cwhmisc)


### Name: eql
### Title: Check on equality, including NA==NA and NaN==NaN.
### Aliases: eql
### Keywords: arith

### ** Examples

  eql(c(1,2,3),c(1,3)) #>  TRUE FALSE FALSE
  eql(c(1,2,3),c(1,2)) #>  TRUE  TRUE FALSE
  eql(c(NA,NaN,2,NA,3),c(NA,NaN,1,2,3)) #> TRUE TRUE FALSE FALSE TRUE



