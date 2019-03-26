library(rdwd)


### Name: createIndex
### Title: Create file and meta index of the DWD CDC FTP Server
### Aliases: createIndex
### Keywords: manip

### ** Examples

## Not run: 
##D  # Not tested with R CMD check because of file writing
##D link <- "/daily/kl/historical/tageswerte_00699_19490101_19580630_hist.zip"
##D ind <- createIndex(link, dir=tempdir())
##D ind
##D link2 <- "/daily/kl/historical/KL_Tageswerte_Beschreibung_Stationen.txt"
##D link3 <- "/daily/kl/recent/KL_Tageswerte_Beschreibung_Stationen.txt"
##D ind2 <- createIndex(c(link,link2,link3), dir=tempdir(), meta=TRUE)
##D lapply(ind2, head)
## End(Not run)

# For real usage, see last part of
if(interactive())
browseURL("https://github.com/brry/rdwd/blob/master/R/rdwd-package.R")
# where the Indexes are added to the package

# Read results in later:
## Not run: 
##D  ## files normally not yet available:
##D fileIndex2 <- read.table("DWDdata/fileIndex.txt", sep="\t", header=TRUE,
##D                          colClasses="character")
##D metaIndex2 <- read.table("DWDdata/metaIndex.txt", sep="\t", header=TRUE, as.is=TRUE)
## End(Not run)




