library(CoopGame)


### Name: getEmptyParamCheckResult
### Title: getEmptyParamCheckResult for generating stucture according to
###   parameter check results
### Aliases: getEmptyParamCheckResult

### ** Examples

library(CoopGame)

initParamCheck_example=function(numberOfPlayers){
 paramCheckResult=getEmptyParamCheckResult()
 if(numberOfPlayers!=3){
   paramCheckResult$errMessage="The number of players is not 3 as expected"
   paramCheckResult$errCode=1
 }
 return(paramCheckResult)
}

initParamCheck_example(3)
#Output:
#$errCode
#[1] 0
#$errMessage
#NULL




