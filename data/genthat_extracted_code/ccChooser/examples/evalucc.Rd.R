library(ccChooser)


### Name: evalucc
### Title: Evaluation of core collection.
### Aliases: evalucc

### ** Examples

data(dactylis_CC)
data(dactylis_EC)
dactylis_EC<-subset(dactylis_EC, select= -UPGMA)
evalucc(dactylis_CC, dactylis_EC)



