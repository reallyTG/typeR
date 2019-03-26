library(cocor)


### Name: as.htest
### Title: Convert to a list of class 'htest'
### Aliases: as.htest as.htest,cocor-method

### ** Examples

data("aptitude")

cocor.result <- cocor(~knowledge + intelligence.a | logic + intelligence.a,
      aptitude$sample1)
as.htest(cocor.result)




