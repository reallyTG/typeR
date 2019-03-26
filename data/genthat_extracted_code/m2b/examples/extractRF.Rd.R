library(m2b)


### Name: extractRF
### Title: Extract the random forest model from an xytb object
### Aliases: extractRF

### ** Examples

#track_CAGA_005 is dataset
#generate a complete xytb object with derived (over moving windows of 3, 5
#and 9 points, with quantile at 0, 50 and 100%) and shifted information on 10
#and 100 points
xytb<-xytb(track_CAGA_005,"a track",c(3,5,9),c(0,.5,1),c(10,100))
#compute a random forest model to predict behaviour (b, where -1 is
#unobserved behaviour) using the derived
#parameters ("actual")
xytb<-modelRF(xytb,"actual",nob="-1",colin=TRUE,varkeep=c("v","thetarel"),zerovar=TRUE)
#extract the model
modRF<-extractRF(xytb)
# results from randomForest package:
print(modRF)
plot(modRF)



