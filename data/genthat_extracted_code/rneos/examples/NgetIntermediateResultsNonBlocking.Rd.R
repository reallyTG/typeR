library(rneos)


### Name: NgetIntermediateResultsNonBlocking
### Title: XML-RPC method getIntermediateResultsNonBlocking of Neos
### Aliases: NgetIntermediateResultsNonBlocking
### Keywords: IO

### ** Examples

## Not run: 
##D 
##D tmp <-NgetSolverTemplate(category = "go", solvername = "ASA",
##D inputMethod = "AMPL")
##D ## setting path to example model and data file
##D modf <- system.file("ExAMPL", "diet.mod", package = "rneos")
##D datf <- system.file("ExAMPL", "diet.dat", package = "rneos")
##D ## import of file contents
##D modc <- paste(paste(readLines(modf), collapse = "\n"), "\n")
##D datc <- paste(paste(readLines(datf), collapse = "\n"), "\n")
##D ## create list object
##D argslist <- list(model = modc, data = datc, commands = "",
##D comments = "")
##D ## create XML string
##D xmls <- CreateXmlString(neosxml = tmp, cdatalist = argslist)
##D test <- NsubmitJob(xmlstring = xmls, user = "rneos", interface = "",
##D id = 0)
##D NgetIntermediateResultsNonBlocking(obj = test, convert = TRUE)
## End(Not run)



