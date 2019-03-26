library(interlineaR)


### Name: read.pangloss
### Title: Read a file in the format used in the pangloss collection
### Aliases: read.pangloss

### ** Examples

path <- system.file("exampleData", "FOURMI.xml", package="interlineaR")
corpus <- read.pangloss(path)
head(corpus$morphemes)



