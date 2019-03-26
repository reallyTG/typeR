library(dataMaid)


### Name: summaryFunction
### Title: Create an object of class summaryFunction
### Aliases: summaryFunction

### ** Examples


#Define a valid summaryFunction that can be called from summarize() 
#and makeDataReport(). This function counts how many zero entries a given 
#variable has:
 countZeros <- function(v, ...) {
  res <- length(which(v == 0))
  summaryResult(list(feature = "No. zeros", result = res, value = res))
 }

#Convert it to a summaryFunction object. We don't count zeros for 
#logical variables, as they have a different meaning here (FALSE):   
 countZeros <- summaryFunction(countZeros, description = "Count number of zeros",
                             classes = setdiff(allClasses(), "logical"))
                             
#Call it directly :
 countZeros(c(0, 0, 0, 1:100))

#Call it via summarize():
 data(cars)
 summarize(cars, numericSummaries = c(defaultNumericSummaries(),
   "countZeros"))

#Note that countZeros now appears in a allSummaryFunctions() call:
 allSummaryFunctions()




