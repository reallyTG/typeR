library(Publish)


### Name: publish.Score
### Title: Publish predictive accuracy results
### Aliases: publish.Score

### ** Examples

library(riskRegression)
library(survival)
learn = sampleData(100)
val= sampleData(100)
f1=CSC(Hist(time,event)~X1+X8,data=learn)
f2=CSC(Hist(time,event)~X1+X5+X6+X8,learn)
xs=Score(list(f1,f2),data=val,formula=Hist(time,event)~1)
publish(xs)




