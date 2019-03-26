library(berryFunctions)


### Name: combineFiles
### Title: Combine Textfiles into one
### Aliases: combineFiles
### Keywords: IO character file

### ** Examples


## These are skipped by rcmd check (writing to external places is not allowed)
## Not run: 
##D cat("This is Sparta.\nKicking your face.", file="BujakashaBerry1.txt")
##D cat("Chuck Norris will roundhousekick you.", file="BujakashaBerry2.txt")
##D combineFiles(inFiles=paste0("BujakashaBerry", 1:2, ".txt"),
##D              outFile="BujakashaBerry3.txt")
##D file.show("BujakashaBerry3.txt")
##D unlink(paste0("BujakashaBerry", 1:3, ".txt"))
## End(Not run)




