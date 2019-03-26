library(robCompositions)


### Name: ilr.2x2
### Title: ilr coordinates in 2x2 tables
### Aliases: ilr.2x2

### ** Examples

data(employment) 
ilr.2x2(employment[,,"AUT"])
ilr.2x2(employment[,,"AUT"], version = "paper")
ilr.2x2(employment, margin = 3, version = "paper")
ilr.2x2(employment[,,"AUT"], type = "interaction")



