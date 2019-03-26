library(Rmixmod)


### Name: mixmodLearn.default
### Title: Create an instance of the ['MixmodLearn'] class
### Aliases: mixmodLearn.default

### ** Examples

  ## A quantitative example with the famous iris data set
  learn.iris<-mixmodLearn(iris[1:4], iris$Species)
  ## get summary
  summary(learn.iris)

  ## A qualitative example with the famous birds data set
  data(birds)
  birds.partition<-as.integer(c(rep(1,34),rep(2,35)))
  learn.birds<-mixmodLearn(data=birds, knownLabels=birds.partition)
  ## get summary
  summary(learn.birds)

  ## A composite example with a heterogeneous data set
  data(heterodatatrain)
  learn.hetero<-mixmodLearn(heterodatatrain[-1],knownLabels=heterodatatrain$V1)
  ## get summary
  summary(learn.hetero)




