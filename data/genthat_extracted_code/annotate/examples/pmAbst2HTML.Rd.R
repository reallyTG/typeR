library(annotate)


### Name: pmAbst2HTML
### Title: HTML Generation for PubMed Abstracts
### Aliases: pmAbst2HTML
### Keywords: utilities

### ** Examples

        x <- pubmed("9695952","8325638","8422497")
        a <- xmlRoot(x)
        numAbst <- length(xmlChildren(a))
        absts <- list()
        for (i in 1:numAbst) {
           absts[[i]] <- buildPubMedAbst(a[[i]])
        }
        ## First try it w/o frames - using a temporary
        ## file for the output
        fname <- tempfile()
        pmAbst2HTML(absts,filename=fname)

        if (interactive())
          browseURL(paste("file://",fname,sep=""))

        ## Now try it w/ frames, using temporary files again.
        fnameBase <- tempfile()
        pmAbst2HTML(absts,filename=fnameBase, frames=TRUE)

        if (interactive())
          browseURL(paste("file://",fnameBase,"index.html",sep=""))




