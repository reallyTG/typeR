library(sboost)


### Name: assess
### Title: sboost Assessment Function
### Aliases: assess

### ** Examples

# malware
malware_classifier <- sboost(malware[-1], malware[1], iterations = 5, positive = 1)
assess(malware_classifier, malware[-1], malware[1])

# mushrooms
mushroom_classifier <- sboost(mushrooms[-1], mushrooms[1], iterations = 5, positive = "p")
assess(mushroom_classifier, mushrooms[-1], mushrooms[1])



