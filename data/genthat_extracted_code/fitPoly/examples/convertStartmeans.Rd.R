library(fitPoly)


### Name: convertStartmeans
### Title: A function to convert a set of mixture means from one ploidy to
###   another
### Aliases: convertStartmeans

### ** Examples

# means from tetraploid data set:
tetrameans <- data.frame(MarkerName=c("mrk1", "mrk2"), mu0=c(0.02, 0.0),
mu1=c(0.2, 0.25), mu2=c(0.3, 0.5), mu3=c(0.4, 0.75), mu4=c(0.6, 1.0))
# convert to means for triploid data set:
trimeans <- convertStartmeans(ploidy=3, origmeans=tetrameans)
tetrameans
trimeans




