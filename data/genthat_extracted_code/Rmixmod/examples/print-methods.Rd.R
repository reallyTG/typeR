library(Rmixmod)


### Name: print
### Title: Print a Rmixmod class to standard output.
### Aliases: print print,CompositeParameter-method
###   print,GaussianParameter-method print,Mixmod-method
###   print,MixmodCluster-method print,MixmodDAResults-method
###   print,MixmodLearn-method print,MixmodPredict-method
###   print,MixmodResults-method print,Model-method
###   print,MultinomialParameter-method print,Strategy-method

### ** Examples

  ## for strategy
  strategy <- mixmodStrategy()
  print(strategy)

  ## for Gaussian models
  gmodel <- mixmodGaussianModel()
  print(gmodel)
  ## for multinomial models
  mmodel <- mixmodMultinomialModel()
  print(mmodel)

  ## for clustering
  data(geyser)
  xem <- mixmodCluster(geyser,3)
  print(xem)
  ## for Gaussian parameters
  print(xem["bestResult"]["parameters"])

  ## for discriminant analysis
  # start by extract 10 observations from iris data set
  iris.partition<-sample(1:nrow(iris),10)
  # then run a mixmodLearn() analysis without those 10 observations
  learn<-mixmodLearn(iris[-iris.partition,1:4], iris$Species[-iris.partition])
  # print learn results
  print(learn)
  # create a MixmodPredict to predict those 10 observations
  prediction <- mixmodPredict(data=iris[iris.partition,1:4], classificationRule=learn["bestResult"])
  # print prediction results
  print(prediction)




