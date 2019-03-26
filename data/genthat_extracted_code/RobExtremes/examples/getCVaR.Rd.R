library(RobExtremes)


### Name: getCVaR
### Title: Risk Measures for Scale-Shape Families
### Aliases: getVaR getCVaR getEL print.riskMeasure
### Keywords: risk measure

### ** Examples

  ## No test: 
 # to reduce checking time
  set.seed(123)
  GPD <- GParetoFamily(loc=20480, scale=7e4, shape=0.3)
  data <- r(GPD)(500)
  getCVaR(data,GPD,0.99)
  getVaR(data,GPD,0.99)
  getEL(data,GPD,5)
  getVaR(data,GPD,0.99, rob=FALSE)
  getEL(data,GPD,5, rob=FALSE)
  getCVaR(data,GPD,0.99, rob=FALSE)
  
## End(No test)



