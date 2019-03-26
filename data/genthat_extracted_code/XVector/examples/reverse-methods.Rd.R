library(XVector)


### Name: reverse-methods
### Title: Reverse an XVector or XVectorList object
### Aliases: reverse-methods reverse,SharedRaw-method
###   reverse,SharedVector_Pool-method reverse,XVector-method
###   rev,XVector-method reverse,XVectorList-method
### Keywords: methods manip

### ** Examples

## On an XInteger object:
x <- as(12:-2, "XInteger")
reverse(x)

## On an XIntegerViews object:
v <- successiveViews(x, 1:5)
v
reverse(v)

## On an XVectorList object:
if (require(Biostrings) && require(drosophila2probe)) {
  library(Biostrings)
  library(drosophila2probe)
  probes <- DNAStringSet(drosophila2probe)
  reverse(probes)
}



