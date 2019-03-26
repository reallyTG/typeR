library(dataMaid)


### Name: checkFunction
### Title: Create an object of class checkFunction
### Aliases: checkFunction

### ** Examples


#Define a minimal requirement checkFunction that can be called
#from check() and makeDataReport(). This function checks whether all
#values in a variable are of equal length and that this
#length is then also larger than 10:
isID <- function(v, nMax = NULL, ...) {
  out <- list(problem = FALSE, message = "")
  if (class(v) %in% c("character", "factor", "labelled", "haven_labelled", "numeric", "integer")) {
    v <- as.character(v)
    lengths <- nchar(v)
    if (all(lengths > 10) & length(unique(lengths)) == 1) {
      out$problem <- TRUE
      out$message <- "Warning: This variable seems to contain ID codes!"
     }
   }
  out
}

#Convert it into a checkFunction
isID <- checkFunction(isID, description = "Identify ID variables (long, equal length values)",
  classes = allClasses())

#Call isID
isID(c("12345678901", "23456789012", "34567890123", "45678901234"))

#isID now appears in a allCheckFunctions() call:
allCheckFunctions()


#Define a new checkFunction using messageGenerator() for generating
#the message and checkResult() for getting a printing method
#for its output. This function identifies values in a variable
#that include a colon, surrounded by alphanumeric characters. If
#at least one such value is found, the variable is flagged as
#having a problem:
identifyColons <- function(v, nMax = Inf, ... ) {
 v <- unique(na.omit(v))
 problemMessage <- "Note: The following values include colons:"
 problem <- FALSE
 problemValues <- NULL
 problemValues <- v[sapply(gregexpr("[[:xdigit:]]:[[:xdigit:]]", v),
                           function(x) all(x != -1))]
 if (length(problemValues) > 0) {
   problem <- TRUE
 }
 problemStatus <- list(problem = problem,
                       problemValues = problemValues)
 outMessage <- messageGenerator(problemStatus, problemMessage, nMax)
 checkResult(list(problem = problem,
                  message = outMessage,
                  problemValues = problemValues))
}

#Make it a checkFunction:
identifyColons <- checkFunction(identifyColons,
     description = "Identify non-suffixed nor -prefixed colons",
     classes = c("character", "factor", "labelled", "haven_labelled"))

#Call it:
identifyColons(1:100)
identifyColons(c("a:b", 1:10, ":b", "a:b:c:d"))

#identifyColons now appears in a allCheckFunctions() call:
allCheckFunctions()

#Define a checkFunction that looks for negative values in numeric
#or integer variables:
identifyNeg <- function(v, nMax = Inf, maxDecimals = 2, ...) {
  problem <- FALSE
  problemValues <- printProblemValues <- NULL
  problemMessage <- "Note: The following negative values were found:"
  negOcc <- unique(v[v < 0])
  if (length(negOcc > 0)) {
    problemValues <- negOcc
    printProblemValues <- round(negOcc, maxDecimals)
    problem <- TRUE
  }
  outMessage <- messageGenerator(list(problem = problem,
    problemValues = printProblemValues), problemMessage, nMax)
  checkResult(list(problem = problem,
                   message = outMessage,
                   problemValues = problemValues))
}

#Make it a checkFunction
identifyNeg <- checkFunction(identifyNeg, "Identify negative values",
  classes = c("integer", "numeric"))

#Call it:
identifyNeg(c(0:100))
identifyNeg(c(-20.1232323:20), nMax = 3, maxDecimals = 4)

#identifyNeg now appears in a allCheckFunctions() call:
 allCheckFunctions()




