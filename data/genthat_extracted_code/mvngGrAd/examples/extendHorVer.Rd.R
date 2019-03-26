library(mvngGrAd)


### Name: extendHorVer
### Title: Vertical and horizontal extension of the grid ('cross shape')
### Aliases: extendHorVer
### Keywords: design

### ** Examples

shape <- list(c(1,2,3),
              c(1,2,3),
              c(1:5),
              c(1:5))

extendHorVer(i = 25,
             j = 25,
             shapeCross = shape,
             rowLimit = 50,
             colLimit = 50)




