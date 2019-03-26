library(ape)


### Name: as.alignment
### Title: Conversion Among DNA Sequence Internal Formats
### Aliases: as.alignment as.DNAbin as.DNAbin.character as.DNAbin.list
###   as.DNAbin.alignment as.character.DNAbin as.DNAbin.DNAString
###   as.DNAbin.DNAStringSet as.DNAbin.PairwiseAlignmentsSingleSubject
###   as.DNAbin.DNAMultipleAlignment
### Keywords: manip

### ** Examples

data(woodmouse)
x <- as.character(woodmouse)
x[, 1:20]
str(as.alignment(x))
identical(as.DNAbin(x), woodmouse)
### conversion from BioConductor:
## Not run: 
##D if (require(Biostrings)) {
##D data(phiX174Phage)
##D X <- as.DNAbin(phiX174Phage)
##D ## base frequencies:
##D base.freq(X) # from ape
##D alphabetFrequency(phiX174Phage) # from Biostrings
##D ### for objects of class "DNAStringSetList"
##D X <- lapply(x, as.DNAbin) # a list of lists
##D ### to put all sequences in a single list:
##D X <- unlist(X, recursive = FALSE)
##D class(X) <- "DNAbin"
##D }
## End(Not run)



