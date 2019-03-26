library(dad)


### Name: print.foldermtg
### Title: Printing an object of class 'foldermtg'
### Aliases: print.foldermtg

### ** Examples

mtgfile1 <- system.file("extdata/plant1.mtg", package = "dad")
xmtg1 <- read.mtg(mtgfile1)
print(xmtg1)
print(xmtg1, topology = TRUE)
print(xmtg1, coordinates = TRUE)

mtgfile2 <- system.file("extdata/plant2.mtg", package = "dad")
xmtg2 <- read.mtg(mtgfile2)
print(xmtg2)
print(xmtg2, topology = TRUE)
print(xmtg2, coordinates = TRUE)



