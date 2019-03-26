library(atlantistools)


### Name: load_txt
### Title: Function to load various txt files from Atlantis simulations
### Aliases: load_txt

### ** Examples

d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
file <- file.path(d, "outputSETASSSB.txt")
load_txt(file)

file <- file.path(d, "outputSETASYOY.txt")
load_txt(file)



