library(BIOM.utils)


### Name: BIOM Examples
### Title: BIOM examples and related utilities
### Aliases: buildBiomExamples applyBiomMethods exampleBiomFile jtxt smat
###   dmat li1 li2 li3 li4

### ** Examples

str(jtxt)
str(smat)
str(dmat)
str(li1)
str(li2)
str(li3)
exampleBiomFile()

xx <- biom (file=exampleBiomFile())
yy <- biom (dmat, quiet=TRUE)
zz <- biom (li4)

## Not run: 
##D ##  this prints a large volume of text:
##D applyBiomMethods(xx)
##D applyBiomMethods (yy)
##D 
##D ##  this requires package MGRASTer:
##D tt1 <- tempfile()
##D tt2 <- tempfile()
##D buildBiomExamples (tt1, tt2)
##D unlink (tt1)
##D unlink (tt2)
## End(Not run)



