library(SensoMineR)


### Name: triangle.design
### Title: Construct a design for triangle tests
### Aliases: triangle.design
### Keywords: models

### ** Examples

##Example 1
design1 = triangle.design (nbprod = 4, nbpanelist = 8)

##Example 2
design2 = triangle.design(nbprod = 4, nbpanelist = 6, bypanelist = 3,
  labprod=c("prod1","prod2","prod3","prod4"),
  labpanelist=c("John","Audrey","Peter","Martina","James","Lisa"))
  



