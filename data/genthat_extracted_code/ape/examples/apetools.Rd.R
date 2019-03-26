library(ape)


### Name: apetools
### Title: Tools to Explore Files
### Aliases: apetools Xplorefiles Xplor editFileExtensions bydir
### Keywords: manip

### ** Examples

## Not run: 
##D x <- Xplorefiles()
##D x # all data files on your disk
##D bydir(x) # sorted by directories
##D bydir(x["fasta"]) # only the FASTA files
##D Xplorefiles(getwd(), recursive = FALSE) # look only in current dir
##D Xplor()
## End(Not run)


