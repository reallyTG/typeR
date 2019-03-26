library(inpdfr)


### Name: doMetacomEntropart
### Title: Performs an analysis of ecological diversity and structure.
### Aliases: doMetacomEntropart

### ** Examples

## Not run: 
##D data("loremIpsum")
##D loremIpsum01 <- loremIpsum[1:10]
##D loremIpsum02 <- loremIpsum[11:20]
##D loremIpsum03 <- loremIpsum[21:30]
##D subDir <- "RESULTS"
##D dir.create(file.path(getwd(), subDir), showWarnings = FALSE)
##D write(x = loremIpsum01, file = "RESULTS/loremIpsum01.txt")
##D write(x = loremIpsum02, file = "RESULTS/loremIpsum02.txt")
##D write(x = loremIpsum03, file = "RESULTS/loremIpsum03.txt")
##D wordOccuDF <- getwordOccuDF(mywd = paste0(getwd(), "/RESULTS"), 
##D   excludeSW = FALSE)
##D file.remove(list.files(full.names = TRUE, 
##D   path = paste0(getwd(), "/RESULTS"), pattern = "loremIpsum"))
##D doMetacomEntropart(wordF = wordOccuDF)
## End(Not run)



