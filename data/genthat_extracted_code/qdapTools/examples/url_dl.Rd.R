library(qdapTools)


### Name: url_dl
### Title: Download Instructional Documents
### Aliases: url_dl

### ** Examples

## Not run: 
##D ## Example 1 (download from Dropbox)
##D # download transcript of the debate to working directory
##D library(qdap)
##D url_dl(pres.deb1.docx, pres.deb2.docx, pres.deb3.docx)   
##D 
##D # load multiple files with read transcript and assign to working directory
##D dat1 <- read.transcript("pres.deb1.docx", c("person", "dialogue"))
##D dat2 <- read.transcript("pres.deb2.docx", c("person", "dialogue"))
##D dat3 <- read.transcript("pres.deb3.docx", c("person", "dialogue"))
##D 
##D docs <- qcv(pres.deb1.docx, pres.deb2.docx, pres.deb3.docx)
##D dir() %in% docs
##D library(reports); delete(docs)    #remove the documents
##D dir() %in% docs
##D 
##D ## Example 2 (quoted string urls)
##D url_dl("https://dl.dropboxusercontent.com/u/61803503/qdap.pdf", 
##D    "http://www.cran.r-project.org/doc/manuals/R-intro.pdf")
##D 
##D delete(c("qdap.pdf", "R-intro.pdf"))
## End(Not run)



