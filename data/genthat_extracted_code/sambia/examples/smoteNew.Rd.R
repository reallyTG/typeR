library(sambia)


### Name: smoteNew
### Title: smoteNew is a necessary function that modifies the SMOTE
###   algorithm.
### Aliases: smoteNew

### ** Examples

library(smotefamily)
library(sambia)
data.example = sample_generator(10000,ratio = 0.80)
genData = sambia:::smoteNew(data.example[,-3],data.example[,3],K = 5,class.to.oversample = 'p')



