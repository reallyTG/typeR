library(dad)


### Name: mtgplant2
### Title: Class 'foldermtg'
### Aliases: mtgplant2
### Keywords: datasets

### ** Examples

data(mtgplant2)
print(mtgplant2)

# To read these data from a MTG file:
mtgfile2 <- system.file("extdata/plant2.mtg", package = "dad")
mtgplant2 <- read.mtg(mtgfile2)
print(mtgplant2)



