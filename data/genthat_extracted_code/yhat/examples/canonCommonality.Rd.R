library(yhat)


### Name: canonCommonality
### Title: Commonality Coefficents for Canonical Correlation
### Aliases: canonCommonality
### Keywords: multivariate

### ** Examples

  ## Example parallels the R builtin cancor and the 
  ## yacca cca example
     data(LifeCycleSavings)
     pop <- LifeCycleSavings[, 2:3]
     oec <- LifeCycleSavings[, -(2:3)]
  ## Perform Commonality Coefficient Analysis
     canonCommonData<-canonCommonality(pop,oec,1)

  ## Use HS dataset in MBESS 
     require ("MBESS")
     data(HS.data)
     attach(HS.data)
  ## Create canonical variable sets
     MATH_REASON<-HS.data[,c("deduct","problemr")]
     MATH_FUND<-HS.data[,c("numeric","arithmet","addition")] 
  ## Perform Commonality Coefficient Analysis
     canonCommonData<-canonCommonality(MATH_FUND,MATH_REASON,1)
     detach(HS.data)      



