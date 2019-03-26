library(divDyn)


### Name: seqduplicated
### Title: Determination and omission of consecutive duplicates in a
###   vector.
### Aliases: seqduplicated collapse

### ** Examples

  
# example vector
  examp <- c(4,3,3,3,2,2,1,NA,3,3,1,NA,NA,5, NA, 5)

# seqduplicated()
  seqduplicated(examp)

  # contrast with 
  duplicated(examp)

  # with NA removal
  seqduplicated(examp, na.rm=TRUE)
 
# the same with collapse()
  collapse(examp)

  # contrast with 
  unique(examp)

  # with NA removal
  collapse(examp, na.rm=TRUE)

  # with NA removal, no breaking
  collapse(examp, na.rm=TRUE, na.breaks=FALSE)





