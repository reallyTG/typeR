library(fBasics)


### Name: getS4
### Title: General S4 Class Extractor Functions
### Aliases: getS4 getCall getCall,ANY-method getModel getModel.default
###   getTitle getDescription getSlot getArgs
### Keywords: programming

### ** Examples

## Example S4 Representation:
   # Hyothesis Testing with Control Settings
   setClass("hypTest",
     representation(
       call = "call",
       data = "numeric",
       test = "list",
       description = "character")
   )

## Shapiro Wilk Normaility Test
   swTest = function(x, description = "") {
     ans = shapiro.test(x)
     class(ans) = "list"
     new("hypTest",
       call = match.call(),
       data = x,
       test = ans,
       description = description)
   }
   test = swTest(x = rnorm(500), description = "500 RVs")

## Extractor Functions:
   isS4(test)
   getCall(test)
   getDescription(test)

## get arguments
args(returns)
getArgs(returns)
getArgs("returns")
getArgs(returns, "timeSeries")
getArgs("returns", "timeSeries")




