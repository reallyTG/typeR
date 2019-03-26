library(R2BayesX)


### Name: read.bnd
### Title: Read Geographical Information in Boundary Format
### Aliases: read.bnd
### Keywords: spatial

### ** Examples

file <- file.path(find.package("R2BayesX"), "examples", "Germany.bnd")
germany <- read.bnd(file)
plotmap(germany)



