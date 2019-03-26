library(needmining)


### Name: filterTweetsNeedwords
### Title: Filter tweets containing need indicating words
### Aliases: filterTweetsNeedwords

### ** Examples

data(NMTrainingData)
needWordsNeedsOnly <- "need;want;wish;feature;ask;would like;improve;idea;upgrade"
needsSimple <- filterTweetsNeedwords(NMTrainingData, needWordsNeedsOnly)
needWordsExtended <- "need;want;wish;feature;ask;would like;improve;idea;upgrade;
					support;problem;issue;help;fix;complain;fail"
needsSimpleExtended <- filterTweetsNeedwords(NMTrainingData, needWordsExtended)



