library(BayesX)


### Name: read.bnd
### Title: Read Geographical Information in Boundary Format
### Aliases: read.bnd
### Keywords: spatial

### ** Examples

germany <- read.bnd(system.file("examples/germany.bnd", package="BayesX"))
drawmap(map=germany)
attributes(germany)

germany <- read.bnd(system.file("examples/germany2001.bnd", package="BayesX"))
drawmap(map=germany)
attributes(germany)



