library(Rmixmod)


### Name: oldmixmodPredict
### Title: Create an instance of the ['MixmodPredict'] class
### Aliases: oldmixmodPredict

### ** Examples


  # start by extract 10 observations from iris data set
  remaining.obs<-sample(1:nrow(iris),10)
  # then run a mixmodLearn() analysis without those 10 observations
  learn<-mixmodLearn(iris[-remaining.obs,1:4], iris$Species[-remaining.obs])
  # create a MixmodPredict to predict those 10 observations
  prediction <- mixmodPredict(data=iris[remaining.obs,1:4], classificationRule=learn["bestResult"])
  # show results
  prediction
  # compare prediction with real results
  paste("accuracy= ",mean(as.integer(iris$Species[remaining.obs]) == prediction["partition"])*100
        ,"%",sep="")

  ## A composite example with a heterogeneous data set
  data(heterodatatrain)
  ## Learning with training data
  learn <- mixmodLearn(heterodatatrain[-1],knownLabels=heterodatatrain$V1)
  ## Prediction on the testing data
  data(heterodatatest)
  prediction <- mixmodPredict(heterodatatest[-1],learn["bestResult"])
  # compare prediction with real results
  paste("accuracy= ",mean(heterodatatest$V1 == prediction["partition"])*100,"%",sep="")




