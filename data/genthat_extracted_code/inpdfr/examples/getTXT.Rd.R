library(inpdfr)


### Name: getTXT
### Title: Extract text from TXT files and return a word-occurrence
###   data.frame.
### Aliases: getTXT

### ** Examples

data("loremIpsum")
loremIpsum01 <- loremIpsum[1:100]
loremIpsum02 <- loremIpsum[101:200]
loremIpsum03 <- loremIpsum[201:300]
loremIpsum04 <- loremIpsum[301:400]
loremIpsum05 <- loremIpsum[401:500]
subDir <- "RESULTS"
dir.create(file.path(getwd(), subDir), showWarnings = FALSE)
write(x = loremIpsum01, file = "RESULTS/loremIpsum01.txt")
write(x = loremIpsum02, file = "RESULTS/loremIpsum02.txt")
write(x = loremIpsum03, file = "RESULTS/loremIpsum03.txt")
write(x = loremIpsum04, file = "RESULTS/loremIpsum04.txt")
write(x = loremIpsum05, file = "RESULTS/loremIpsum05.txt")
wordOccuFreq <- getTXT(myTXTs = list.files(path = paste0(getwd(), 
  "/RESULTS/"), pattern = "loremIpsum", full.names = TRUE))
file.remove(list.files(full.names = TRUE, 
  path = paste0(getwd(), "/RESULTS"), pattern = "loremIpsum"))



