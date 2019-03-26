library(inpdfr)


### Name: getAllAnalysis
### Title: A quick way to compute a set of analysis from the
###   word-occurrence data.frame.
### Aliases: getAllAnalysis

### ** Examples

## Not run: 
##D data("loremIpsum")
##D loremIpsum01 <- loremIpsum[1:100]
##D loremIpsum02 <- loremIpsum[101:200]
##D loremIpsum03 <- loremIpsum[201:300]
##D loremIpsum04 <- loremIpsum[301:400]
##D loremIpsum05 <- loremIpsum[401:500]
##D subDir <- "RESULTS"
##D dir.create(file.path(getwd(), subDir), showWarnings = FALSE)
##D write(x = loremIpsum01, file = "RESULTS/loremIpsum01.txt")
##D write(x = loremIpsum02, file = "RESULTS/loremIpsum02.txt")
##D write(x = loremIpsum03, file = "RESULTS/loremIpsum03.txt")
##D write(x = loremIpsum04, file = "RESULTS/loremIpsum04.txt")
##D write(x = loremIpsum05, file = "RESULTS/loremIpsum05.txt")
##D wordOccuDF <- getwordOccuDF(mywd = paste0(getwd(), "/RESULTS"), 
##D   excludeSW = FALSE)
##D file.remove(list.files(full.names = TRUE, 
##D   path = paste0(getwd(), "/RESULTS"), pattern = "loremIpsum"))
##D getAllAnalysis(dataset = wordOccuDF, wcloud = FALSE, sumStats = FALSE)
## End(Not run)



