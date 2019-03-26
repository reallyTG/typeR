library(hamlet)


### Name: vcapwide
### Title: Wide-format data of the Castration-resistant Prostate Cancer
###   experiment using the VCaP cell line.
### Aliases: vcapwide
### Keywords: datasets

### ** Examples

data(vcapwide)

str(vcapwide)
head(vcapwide)

mixplot(vcapwide[,c("PSAWeek10", "PSAWeek14", "BWWeek10", "Group")], pch=16)
anv <- aov(PSA ~ Group, data.frame(PSA = vcapwide[,"PSAWeek14"], Group = vcapwide[,"Group"]))
summary(anv)
TukeyHSD(anv)
summary(aov(BW ~ Group, data.frame(BW = vcapwide[,"BWWeek14"], Group = vcapwide[,"Group"])))



