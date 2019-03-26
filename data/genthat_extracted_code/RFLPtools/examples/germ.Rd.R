library(RFLPtools)


### Name: germ
### Title: Compute matches for RFLP data via GERM.
### Aliases: germ
### Keywords: multivariate

### ** Examples

  data(refDataGerm)
  data(newDataGerm)
  
  ## Example 1
  res1 <- germ(newDataGerm[1:7,], refDataGerm)
  
  ## Example 2
  res2 <- germ(newDataGerm[8:15,], refDataGerm)
  
  ## Example 3
  res3 <- germ(newDataGerm[16:20,], refDataGerm)
  
  ## all three examples in one step
  res.all <- germ(newDataGerm, refDataGerm)



