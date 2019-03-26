library(rneos)


### Name: CreateXmlString
### Title: Inserting CDATA into XML-templates of NEOS
### Aliases: CreateXmlString
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
##D cat(modc)
##D datc <- paste(paste(readLines(datf), collapse = "\n"), "\n")
##D cat(datc)
##D ## create list object
##D argslist <- list(model = modc, data = datc, commands = "",
##D comments = "")
##D ## create XML string
##D xmls <- CreateXmlString(neosxml = tmp, cdatalist = argslist)
##D xmls
## End(Not run)



