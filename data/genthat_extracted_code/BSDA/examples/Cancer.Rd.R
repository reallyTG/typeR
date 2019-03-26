library(BSDA)


### Name: Cancer
### Title: Survival times of terminal cancer patients treated with vitamin
###   C
### Aliases: Cancer
### Keywords: datasets

### ** Examples


boxplot(survival ~ type, Cancer, col = "blue")
stomach <- Cancer$survival[Cancer$type == "stomach"]
bronchus <- Cancer$survival[Cancer$type == "bronchus"]
boxplot(stomach, ylab = "Days")
SIGN.test(stomach, md = 100, alternative = "greater")
SIGN.test(bronchus, md = 100, alternative = "greater")
rm(bronchus, stomach)





