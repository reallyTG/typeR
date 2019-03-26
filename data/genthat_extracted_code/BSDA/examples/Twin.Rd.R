library(BSDA)


### Name: Twin
### Title: Intelligence test scores for identical twins in which one twin
###   is given a drug
### Aliases: Twin
### Keywords: datasets

### ** Examples


qqnorm(Twin$differ)
qqline(Twin$differ)
shapiro.test(Twin$differ)
t.test(Twin$twinA, Twin$twinB, paired = TRUE)




