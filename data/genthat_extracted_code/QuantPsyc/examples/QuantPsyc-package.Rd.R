library(QuantPsyc)


### Name: QuantPsyc-package
### Title: Quantitative Psychology Tools
### Aliases: QuantPsyc-package QuantPsyc
### Keywords: package

### ** Examples


# Data Screening

data(USJudgeRatings)
norm(USJudgeRatings$CONT)
mult.norm(USJudgeRatings[,1:4])

# Moderation
data(tra)
lm.mod1 <- moderate.lm(beliefs, values, attitudes, tra)
ss.mod1 <- sim.slopes(lm.mod1,meanCenter(tra$values))
summary(lm.mod1)
ss.mod1
# use mouse click to place legend in graph.mod
# graph.mod(ss.mod1,beliefs,attitudes,tra,"Interaction Example")

# Mediation
# create object with names x, m, y
# data(tra)
temp.tra <- tra
names(temp.tra) <- c("x", "z", "m", "y")
proximal.med(temp.tra)




