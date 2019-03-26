library(HH)


### Name: hh
### Title: Resolve filenames relative to the HH directory.
### Aliases: hh hh.old hh.file hh.file.DOS HH.ROOT.DIR HHfile.ROOT.DIR
### Keywords: utilities environment

### ** Examples

## hotdog <- read.table(hh.old("datasets/hotdog.dat"), header=TRUE)
## This form of data input for files from the text has been replaced by
## the alternate form
##     data(hotdog)


## Not run: 
##D ## Define the HHfile.ROOT.DIR option first.
##D ## Define
##D ##   options(HHfile.ROOT.DIR="c:/HOME/hh")  ## value recommended in Appendix B
##D ## before using the hh.file() functions.
##D hh.file("relativefilepath")
##D hh.file.DOS("relativefilepath")
##D hh.file.DOS("relativefilepath", displayForCutAndPaste=FALSE)
## End(Not run)




