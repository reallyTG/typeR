library(GSAfisherCombined)


### Name: GSAfisher.summary
### Title: GSAfisher.summary
### Aliases: GSAfisher.summary
### Keywords: summary

### ** Examples

#Generate 1000 random values from an Uniform distribution U (0, 0.25). 
x<-runif(1000, 0, 0.25)
#Set data class to "summary"
class(x)<-"summary"
#Apply the GSAfisher.summary function to this data vector.
GSAfisher(x)



