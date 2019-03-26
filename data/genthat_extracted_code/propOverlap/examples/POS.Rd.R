library(propOverlap)


### Name: POS
### Title: Calculating the proportional Overlapping Scores.
### Aliases: POS
### Keywords: univar

### ** Examples

data(leukaemia)
Score <- POS(leukaemia[1:7129,], CI.emprical(leukaemia[1:7129,],
leukaemia[7130,]), leukaemia[7130,])
Score[1:5]      #show the proportional overlapping scores for the first 5 features
summary(Score)  #show the the summary of the scores of all features.



