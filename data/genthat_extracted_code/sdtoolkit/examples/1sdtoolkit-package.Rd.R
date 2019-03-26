library(sdtoolkit)


### Name: sdtoolkit-package
### Title: Scenario Discovery Tools to Support Robust Decision Making
### Aliases: sdtoolkit-package sdtoolkit
### Keywords: package

### ** Examples


## Not run: 
##D #Note that all the examples shown here do not illustrate use of the extra 
##D #options that can be passed to the functions as additional arguments.  The
##D #Individual function help files illustrate the use of optional
##D #arguments in more details.  
##D 
##D #Also, here and in other example sections of code you may see the code preceded 
##D #by "## Not run:" - this refers to sections of code being exempt from R's 
##D #automatic example code checking due to their interactive nature.  Lines of code
##D #that immediately follow "## Not run:" should still be runnable, provided you
##D #remove the "## Not run:" comment.
##D 
##D ### ===== SD.START: =====
##D 
##D #Users not familiar with importing and manipulating data in R will wish to start
##D #with:
##D 
##D \dontrun{
##D myboxes <- sd.start()
##D }
##D 
##D #This will prompt for things like directory and file name, and then walk through 
##D #data inspection, thresholding, and offer to call sdprim.  
##D 
##D 
##D ### ===== SDPRIM: =====
##D 
##D #Users confident in the soundness and appropriate formatting of their data may 
##D #take the following more direct actions: 
##D 
##D \dontrun{
##D 
##D #LOAD the data, either via:
##D mydata <- read.csv("mycsvfile.csv")
##D 
##D #OR
##D loadedname <- load("myrdafile.rda")
##D mydata <- get(loadedname)
##D 
##D #Then define their input variables:
##D xmatrix <- mydata[,columnindexes]
##D 
##D #Then define their output variable using EITHER
##D outputvar <- mydata[,outputcolumnnumber]
##D 
##D #OR
##D outputvar <- mydata[,"outputname"]
##D 
##D #If output var is already a 0-1 variable, then sdprim can be called as:
##D myboxes <- sdprim(x=xmatrix, y=outputvar)
##D 
##D #Otherwise, first threshold the output variable as follows:
##D outthresh <- 1*(outputvar>threshold)
##D 
##D #Then call sdprim:
##D myboxes <- sdprim(x=xmatrix, y=outthresh)
##D }
##D 
##D ### ===== SEQ.INFO: =====
##D 
##D #To see a summary of sdprim output, 
##D data(exboxes)  #an example box sequence object included with the package
##D boxinfo <- seq.info(exboxes)
##D 
##D 
##D ### ===== DIMPLOT: =====
##D 
##D #To see a 'Normalized Dimension Restriction Plot' for box i, type:
##D data(exboxes)
##D dimplot(exboxes, 1)
##D 
## End(Not run)




