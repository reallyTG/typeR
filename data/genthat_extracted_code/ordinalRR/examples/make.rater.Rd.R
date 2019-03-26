library(ordinalRR)


### Name: make.rater
### Title: Format the parameters for a single rater.
### Aliases: make.rater

### ** Examples

(rater1=make.rater(1,c(-1.7,-0.5,1.6))) #3 cutpoints, so H=4
(prob=compute.q(rater1,.1)) #probabilities of 1,2,3,4 if part quality is x=.1
sum(prob) #should sum to one



