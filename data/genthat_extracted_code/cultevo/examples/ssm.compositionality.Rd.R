library(cultevo)


### Name: ssm.compositionality
### Title: Find a segmentation that maximises the overall string coverage
###   across all signals.
### Aliases: ssm.compositionality ssm.segmentation

### ** Examples

ssm.segmentation(c("as", "bas", "basf"),
  cbind(a=c(TRUE, FALSE, TRUE), b=c(FALSE, TRUE, TRUE)))


# signaling system where one meaning distinction is not encoded in the signals
print(threebytwoanimals <- enumerate.meaningcombinations(list(animal=c("dog", "cat", "tiger"),
  colour=c("col1", "col2"))))

ssm.segmentation(c("greendog", "bluedog", "greenfeline", "bluefeline", "greenfeline", "bluefeline"),
  threebytwoanimals)

# the same analysis again, but allow merging of features
ssm.segmentation(c("greendog", "bluedog", "greenfeline", "bluefeline", "greenfeline", "bluefeline"),
  threebytwoanimals, mergefeatures=TRUE)



