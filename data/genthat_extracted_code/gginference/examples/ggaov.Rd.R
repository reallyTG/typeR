library(gginference)


### Name: ggaov
### Title: Anova F test plot
### Aliases: ggaov

### ** Examples

# 21-th day
chick21 <- ChickWeight[ChickWeight$Time == 21,]
chickaov <- aov(weight~Diet, data = chick21)
summary(chickaov)

ggaov(chickaov, colaccept = "grey89", colreject = "black")




