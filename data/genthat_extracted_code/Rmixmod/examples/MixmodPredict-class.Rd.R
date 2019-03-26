library(Rmixmod)


### Name: MixmodPredict-class
### Title: Constructor of ['MixmodPredict'] class
### Aliases: MixmodPredict-class

### ** Examples

  # start by extract 10 observations from iris data set
  remaining.obs<-sample(1:nrow(iris),10)

  # then run a mixmodLearn() analysis without those 10 observations
  learn<-mixmodLearn(iris[-remaining.obs,1:4], iris$Species[-remaining.obs])
  # create a MixmodPredict to predict those 10 observations
  new("MixmodPredict", data=iris[remaining.obs,1:4], classificationRule=learn["bestResult"])

  getSlots("MixmodPredict")




