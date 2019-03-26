library(sboost)


### Name: sboost
### Title: sboost Learning Algorithm
### Aliases: sboost

### ** Examples

# malware
malware_classifier <- sboost(malware[-1], malware[1], iterations = 5, positive = 1)
malware_classifier
malware_classifier$classifier

# mushrooms
mushroom_classifier <- sboost(mushrooms[-1], mushrooms[1], iterations = 5, positive = "p")
mushroom_classifier
mushroom_classifier$classifier



