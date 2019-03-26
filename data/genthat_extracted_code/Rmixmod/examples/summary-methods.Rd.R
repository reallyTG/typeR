library(Rmixmod)


### Name: summary
### Title: Produce result summaries of a Rmixmod class
### Aliases: summary summary,CompositeParameter-method
###   summary,GaussianParameter-method summary,Mixmod-method
###   summary,MixmodPredict-method summary,MixmodResults-method
###   summary,MultinomialParameter-method

### ** Examples

  data(geyser)
  xem <- mixmodCluster(geyser,3)
  summary(xem)
  summary(xem["bestResult"])
  summary(xem["bestResult"]["parameters"])




