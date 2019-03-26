library(AnnotationDbi)


### Name: Bimap-keys
### Title: Methods for manipulating the keys of a Bimap object
### Aliases: Bimap-keys keys,Bimap-method length,Bimap-method mappedkeys
###   mappedkeys,Bimap-method mappedkeys,environment-method
###   mappedkeys,vector-method count.mappedkeys
###   count.mappedkeys,Bimap-method count.mappedkeys,ANY-method isNA
###   isNA,Bimap-method isNA,environment-method isNA,ANY-method keys<-
###   keys<-,Bimap-method [,Bimap-method show,AnnDbTable-method
### Keywords: methods

### ** Examples

  library(hgu95av2.db)
  x <- hgu95av2GO
  x
  length(x)
  count.mappedkeys(x)
  x[1:3]
  links(x[1:3])

  ## Keep only the mapped keys
  keys(x) <- mappedkeys(x)
  length(x)
  count.mappedkeys(x)
  x # now it is a submap

  ## The above subsetting can also be achieved with
  x <- hgu95av2GO[mappedkeys(hgu95av2GO)]

  ## mappedkeys() and count.mappedkeys() also work with an environment
  ## or a list
  z <- list(k1=NA, k2=letters[1:4], k3="x")
  mappedkeys(z)
  count.mappedkeys(z)

  ## retrieve the set of primary keys for the ChipDb object named 'hgu95av2.db'
  keys <- keys(hgu95av2.db)
  head(keys)



