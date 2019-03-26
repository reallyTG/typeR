library(rneos)


### Name: NgetJobStatus
### Title: XML-RPC method getJobStatus of Neos
### Aliases: NgetJobStatus
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
##D NgetJobStatus(obj = test, convert = TRUE)
## End(Not run)



