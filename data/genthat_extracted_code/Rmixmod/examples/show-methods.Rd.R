library(Rmixmod)


### Name: show
### Title: Show description of a Rmixmod class to standard output.
### Aliases: show show,CompositeParameter-method
###   show,GaussianParameter-method show,Mixmod-method
###   show,MixmodCluster-method show,MixmodDAResults-method
###   show,MixmodLearn-method show,MixmodPredict-method
###   show,MixmodResults-method show,Model-method
###   show,MultinomialParameter-method show,Strategy-method

### ** Examples

  ## for strategy
  strategy <- mixmodStrategy()
  show(strategy)

  ## for Gaussian models
  gmodel <- mixmodGaussianModel()
  show(gmodel)
  ## for multinomial models
  mmodel <- mixmodMultinomialModel()
  show(mmodel)

  ## for clustering
  data(geyser)
  xem <- mixmodCluster(geyser,3)
  show(xem)
  ## for Gaussian parameters
  show(xem["bestResult"]["parameters"])

  ## for discriminant analysis
  # start by extract 10 observations from iris data set
  iris.partition<-sample(1:nrow(iris),10)
  # then run a mixmodLearn() analysis without those 10 observations
  learn<-mixmodLearn(iris[-iris.partition,1:4], iris$Species[-iris.partition])
  # create a MixmodPredict to predict those 10 observations
  prediction <- mixmodPredict(data=iris[iris.partition,1:4], classificationRule=learn["bestResult"])
  # show results
  show(prediction)




