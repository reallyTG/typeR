library(psychometric)


### Name: item.exam
### Title: Item Analysis
### Aliases: item.exam
### Keywords: models univar

### ** Examples


data(TestScores)
# Look at the data
TestScores
# Examine the items
item.exam(TestScores[,1:10], y = TestScores[,11], discrim=TRUE)




