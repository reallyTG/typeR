library(sboost)


### Name: predict.sboost_classifier
### Title: Make predictions for a feature set based on an sboost
###   classifier.
### Aliases: predict.sboost_classifier

### ** Examples

# malware
malware_classifier <- sboost(malware[-1], malware[1], iterations = 5, positive = 1)
predict(malware_classifier, malware[-1], scores = TRUE)
predict(malware_classifier, malware[-1])

# mushrooms
mushroom_classifier <- sboost(mushrooms[-1], mushrooms[1], iterations = 5, positive = "p")
predict(mushroom_classifier, mushrooms[-1], scores = TRUE)
predict(mushroom_classifier, mushrooms[-1])



