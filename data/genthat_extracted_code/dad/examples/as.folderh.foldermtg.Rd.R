library(dad)


### Name: as.folderh.foldermtg
### Title: Build a hierarchic folder from an object of class foldermtg
### Aliases: as.folderh.foldermtg

### ** Examples

mtgfile <- system.file("extdata/plant1.mtg", package = "dad")
x <- read.mtg(mtgfile)

# folderh containing the plant ("P") and the stems ("A")
as.folderh(x, classes = c("P", "A"))

# folderh containing the plant ("P"), axes ("A") and phytomers ("M")
as.folderh(x, classes = c("P", "A", "M"))

# folderh containing the plant ("P") and the phytomers ("M")
as.folderh(x, classes = c("P", "M"))

# folderh containing the axes and phytomers
fhPM <- as.folderh(x, classes = c("A", "M"))
# coerce this folderh into a folder, and compute statistics on this folder
fPM <- as.folder(fhPM)
mean(fPM)



