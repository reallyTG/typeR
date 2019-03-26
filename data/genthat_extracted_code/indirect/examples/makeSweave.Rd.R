library(indirect)


### Name: makeSweave
### Title: Function to create summary document from a saved elicitation
###   record.
### Aliases: makeSweave

### ** Examples

## Not run: 
##D  
##D X <- matrix(c(1, 1, 0, 1), nrow = 2) # design
##D Z <- designLink(design = X)
##D Z <- elicitPt(Z, design.pt = 1,
##D   lower.CI.bound = -1,
##D   median = 0,
##D   upper.CI.bound = 1,
##D   comment = "A completed elicitation scenario.")
##D tmp.rds <- tempfile(pattern = "record", fileext =".rds")
##D saveRecord(Z, file = tmp.rds)
##D tmpReport <- tempfile(pattern = "report")
##D makeSweave(filename.rds = tmp.rds, reportname = tmpReport)
##D setwd(tempdir())
##D utils::Sweave(paste0(tmpReport, ".Rnw"))
##D tools::texi2pdf(paste0(tmpReport, ".tex")) 
## End(Not run)



