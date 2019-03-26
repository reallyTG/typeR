library(rneos)


### Name: NeosXml-class
### Title: Class "NeosXml"
### Aliases: NeosXml-class show,NeosXml-method
### Keywords: classes IO

### ** Examples

showClass("NeosXml")
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
##D NgetJobInfo(obj = test, convert = TRUE)
##D NgetFinalResults(obj = test, convert = TRUE)
## End(Not run)



