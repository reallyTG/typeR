library(inpdfr)


### Name: preProcTxt
### Title: Extract text from txt files and pre-process content.
### Aliases: preProcTxt

### ** Examples

data("loremIpsum")
subDir <- "RESULTS"
dir.create(file.path(getwd(), subDir), showWarnings = FALSE)
write(x = loremIpsum, file = "RESULTS/loremIpsum.txt")
preProcTxt(filetxt = paste0(getwd(), "/RESULTS/loremIpsum.txt"))
file.remove(list.files(full.names = TRUE, 
  path = paste0(getwd(), "/RESULTS"), pattern = "loremIpsum"))



