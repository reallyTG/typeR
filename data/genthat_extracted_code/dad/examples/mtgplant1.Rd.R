library(dad)


### Name: mtgplant1
### Title: Class 'foldermtg'
### Aliases: mtgplant1
### Keywords: datasets

### ** Examples

data(mtgplant1)
print(mtgplant1)

# To read these data from a MTG file:
mtgfile1 <- system.file("extdata/plant1.mtg", package = "dad")
mtgplant1 <- read.mtg(mtgfile1)
print(mtgplant1)



