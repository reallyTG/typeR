library(NSM3)


### Name: RSS
### Title: Ranked-Set Sample
### Aliases: RSS
### Keywords: Ranked-Set Sample RSS

### ** Examples

##Simulate 100 observations of a response variable we are interested in 
##and an auxiliary variable we use for ranking

set.seed(1)
response<-rnorm(100)
auxiliary<-rnorm(100)

##Get the indices for a ranked-set sample with set size 3 and 2 cycles
RSS(2,3,auxiliary) #Tells us to measure observations 2, 19, 32,..., 91

##Alternatively, get the responses for those observations. 
##In practice, response will not be available ahead of time.
response[RSS(2,3,auxiliary)]



