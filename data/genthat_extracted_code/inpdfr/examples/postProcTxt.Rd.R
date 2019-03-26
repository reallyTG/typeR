library(inpdfr)


### Name: postProcTxt
### Title: Prossess vectors containing words into a data.frame of word
###   occurrences.
### Aliases: postProcTxt

### ** Examples

## Not run: 
##D postProcTxt(txt = preProcTxt(filetxt = "loremIpsum.txt"))
## End(Not run)
data("loremIpsum")
subDir <- "RESULTS"
dir.create(file.path(getwd(), subDir), showWarnings = FALSE)
write(x = loremIpsum, file = "RESULTS/loremIpsum.txt")
preProcTxt(filetxt = paste0(getwd(), "/RESULTS/loremIpsum.txt"))
postProcTxt(txt = 
  preProcTxt(filetxt = paste0(getwd(), "/RESULTS/loremIpsum.txt")))
file.remove(list.files(full.names = TRUE, 
  path = paste0(getwd(), "/RESULTS"), pattern = "loremIpsum"))



