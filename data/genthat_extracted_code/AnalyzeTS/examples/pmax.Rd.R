library(AnalyzeTS)


### Name: pmax
### Title: The lag maximum value
### Aliases: pmax

### ** Examples

data(enrollment)
p<-pmax(enrollment)
library(urca)
summary(ur.df(enrollment,type="trend",lag=p,selectlag="BIC"))



