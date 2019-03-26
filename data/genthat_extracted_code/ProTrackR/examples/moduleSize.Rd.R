library(ProTrackR)


### Name: moduleSize
### Title: Get module file size
### Aliases: moduleSize moduleSize,PTModule-method

### ** Examples

## Calculate the file size for the example module 'mod.intro':

data("mod.intro")
moduleSize(mod.intro)

## Note that this is not the same as the size the object
## requires in R working memory:

object.size(mod.intro)

## In working memory it takes more memory to store the module, than in a
## file. This is because the S4 structure of the object consumes some
## memory. In addition, samples are of 8 bit quality, corresponding with
## a byte per sample. In the PTSample object it is stored as a
## vector of integer values. In R, integer values are 32 bit, which
## costs 4 times as much memory as the original 8 bit.




