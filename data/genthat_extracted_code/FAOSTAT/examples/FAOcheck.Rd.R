library(FAOSTAT)


### Name: FAOcheck
### Title: This function perform some check on the data
### Aliases: FAOcheck

### ** Examples

## test.df =
##    data.frame(FAOST_CODE = rep(c(51,167,199), each = 3),
##      Year = rep(c(1990:1992), 3),
##      Value = c(c(3,4,4), c(2,2,2), c(1,2,NA)))
## FAOcheck(var = "Value", data = test.df, type = "overlap", take = "simpleCheck")
## FAOcheck(var = "Value", data = test.df, type = "overlap", take = "takeNew")
## FAOcheck(var = "Value", data = test.df, type = "overlap", take = "takeOld")
## FAOcheck(var = "Value", data = test.df, type = "overlap", take = "complete")



