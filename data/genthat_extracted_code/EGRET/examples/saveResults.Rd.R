library(EGRET)


### Name: saveResults
### Title: A utility program for saving the contents of the workspace This
###   function saves the workspace.  It assigns the file a name using the
###   abbreviations for station and constituent.
### Aliases: saveResults
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
savePath <- "~/"
## Not run: 
##D saveResults(savePath, eList)
##D 
##D #To load:
##D load(paste(savePath,"Chop.nitrogen.RData",sep=""))
## End(Not run)



