library(lctools)


### Name: FLQ
### Title: Focal Location Quotient
### Aliases: FLQ
### Keywords: LQ FLQ Location Quotient Focal Location Quotient

### ** Examples

data(VotesGR)
res<-FLQ(cbind(VotesGR$X, VotesGR$Y),4,VotesGR$NDJune12,VotesGR$AllJune12,0.2966)
boxplot(res)



