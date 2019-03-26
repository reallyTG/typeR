library(dataMaid)


### Name: exampleData
### Title: Example data with zero-inflated variables
### Aliases: exampleData
### Keywords: datasets

### ** Examples


## Not run: 
##D isID <- function(v, nMax = NULL, ...) {
##D   out <- list(problem = FALSE, message = "")
##D   if (class(v) %in% c("character", "factor", "labelled", "numeric", "integer")) {
##D     v <- as.character(v)
##D     lengths <- nchar(v)
##D     if (all(lengths > 10) & length(unique(lengths)) == 1) {
##D       out$problem <- TRUE
##D       out$message <- "Warning: This variable seems to contain ID codes!"
##D     }
##D   }
##D   out
##D }
##D 
##D 
##D countZeros <- function(v, ...) {
##D   res <- length(which(v == 0))
##D   summaryResult(list(feature = "No. zeros", result = res, value = res))
##D }
##D countZeros <- summaryFunction(countZeros, description = "Count number of zeros",
##D                               classes = allClasses())
##D summarize(toyData, numericSummaries = c(defaultNumericSummaries()))
##D 
##D 
##D mosaicVisual <- function(v, vnam, doEval) {
##D   thisCall <- call("mosaicplot", table(v), main = vnam, xlab = "")
##D   if (doEval) {
##D     return(eval(thisCall))
##D   } else return(deparse(thisCall))
##D }
##D mosaicVisual <- visualFunction(mosaicVisual,
##D                                description = "Mosaic plots using graphics",
##D                                classes = allClasses())
##D 
##D identifyColons <- function(v, nMax = Inf, ... ) {
##D   v <- unique(na.omit(v))
##D   problemMessage <- "Note: The following values include colons:"
##D   problem <- FALSE
##D   problemValues <- NULL
##D 
##D   problemValues <- v[sapply(gregexpr("[[:xdigit:]]:[[:xdigit:]]", v),
##D                             function(x) all(x != -1))]
##D 
##D   if (length(problemValues) > 0) {
##D     problem <- TRUE
##D   }
##D 
##D   problemStatus <- list(problem = problem,
##D                         problemValues = problemValues)
##D   outMessage <- messageGenerator(problemStatus, problemMessage, nMax)
##D 
##D   checkResult(list(problem = problem,
##D                    message = outMessage,
##D                    problemValues = problemValues))
##D }
##D 
##D identifyColons <- checkFunction(identifyColons,
##D                                description = "Identify non-suffixed nor -prefixed colons",
##D                                classes = c("character", "factor", "labelled"))
##D makeDataReport(exampleData, replace = TRUE,
##D       preChecks = c("isKey", "isEmpty", "isID"),
##D       allVisuals = "mosaicVisual",
##D       characterSummaries = c(defaultCharacterSummaries(), "countZeros"),
##D       factorSummaries = c(defaultFactorSummaries(), "countZeros"),
##D       labelledSummaries = c(defaultLabelledSummaries(), "countZeros"),
##D       numericSummaries = c(defaultNumericSummaries(), "countZeros"),
##D       integerSummaries = c(defaultIntegerSummaries(), "countZeros"),
##D       characterChecks = c(defaultCharacterChecks(), "identifyColons"),
##D       factorChecks = c(defaultFactorChecks(), "identifyColons"),
##D       labelledCheck = c(defaultLabelledChecks(), "identifyColons"))
##D 
##D 
##D 
## End(Not run)




