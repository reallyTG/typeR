library(zscorer)


### Name: getCohortWGS
### Title: getCohortWGS
### Aliases: getCohortWGS

### ** Examples

  # apply getWGS to first child in sample data anthro1
  wazAll <- getCohortWGS(data = anthro1,
                         sexObserved = "sex",
                         firstPart = "weight",
                         secondPart = "age",
                         index = "wfa")
  wazAll

  hazAll <- getCohortWGS(data = anthro1,
                         sexObserved = "sex",
                         firstPart = "height",
                         secondPart = "age",
                         index = "hfa")
  hazAll

  whzAll <- getCohortWGS(data = anthro1,
                         sexObserved = "sex",
                         firstPart = "weight",
                         secondPart = "height",
                         index = "wfh")
  whzAll



