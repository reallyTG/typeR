library(annotate)


### Name: organism
### Title: Convenience function for getting the organism from an object or
###   package
### Aliases: organism organism,character-method
### Keywords: manip

### ** Examples

  require(hgu95av2.db)
  ## get the organism for this annotation package
  organism("hgu95av2")

  ## get the organism this object refers to
  ## (for a ChromLocation object)
  z <- buildChromLocation("hgu95av2")
  organism(z)




