library(psychometric)


### Name: TestScores
### Title: Fictitious Test Scores for Illustrative Purposes
### Aliases: TestScores
### Keywords: datasets

### ** Examples

data(TestScores)
str(TestScores) 
item.exam(TestScores[,1:10], y = TestScores[,11], discrim=TRUE)
alpha(TestScores[,1:10])



