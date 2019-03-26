library(fastR)


### Name: littleSurvey
### Title: Results from a little survey
### Aliases: littleSurvey
### Keywords: datasets

### ** Examples


data(littleSurvey)
xtabs(~surprise+surpriseVer, data=littleSurvey)
xtabs(~disease+diseaseVer, data=littleSurvey)




