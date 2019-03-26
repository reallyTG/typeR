library(appnn)


### Name: appnn-package
### Title: Amyloid propensity prediction neural network (APPNN)
### Aliases: appnn-package
### Keywords: package

### ** Examples

sequences <- c('STVIIE','KKSSTT','KYSTVI')
predictions <- appnn(sequences)
print(predictions)
plot(predictions,c(1,2,3))



