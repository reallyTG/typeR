library(annotate)


### Name: chromLocation-class
### Title: Class chromLocation, a class for describing genes and their
###   chromosome mappings.
### Aliases: chromLocation-class chromLocation dataSource nChrom chromNames
###   chromLocs chromLengths probesToChrom geneSymbols chromInfo
###   organism,chromLocation-method dataSource,chromLocation-method
###   nChrom,chromLocation-method chromNames,chromLocation-method
###   chromLocs,chromLocation-method chromLengths,chromLocation-method
###   probesToChrom,chromLocation-method geneSymbols,chromLocation-method
###   chromInfo,chromLocation-method show,chromLocation-method
### Keywords: classes

### ** Examples

  library("hgu95av2.db")

  z <- buildChromLocation("hgu95av2")
  
  ## find the number of chromosomes
  nChrom(z)

  ## Find the names of the chromosomes
  chromNames(z)

  ## get the organism this object refers to
  organism(z)

  ## get the lengths of the chromosomes in this object
  chromLengths(z)



