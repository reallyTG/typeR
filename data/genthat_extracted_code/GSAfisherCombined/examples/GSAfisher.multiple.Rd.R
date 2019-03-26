library(GSAfisherCombined)


### Name: GSAfisher.multiple
### Title: GSAfisher.multiple
### Aliases: GSAfisher.multiple
### Keywords: apply

### ** Examples

#Generate 3 vectors with 1000 random values from an Uniform distribution U (0, 0.25). 
data.vector1<-runif(1000, 0, 0.25)
data.vector2<-runif(1000, 0, 0.25)
data.vector3<-runif(1000, 0, 0.25)
#Set data class to "multiple".
class(data.vector1)<-"multiple"
#Apply the GSAfisher.multiple function to these data vectors.
GSAfisher(data.vector1, data.vector2, data.vector3)

#You can also try:
#Generate 5000 vectors with 1000 random values from an Uniform distribution U(0,0.25).
data.vectors<-sapply(1:5000, function (x) runif(1000, 0, 0.25))
#Set data class to "multiple".
class(data.vectors)<-"multiple"
#Apply the GSAfisher.multiple function to these data vectors.
GSAfisher(data.vectors)



