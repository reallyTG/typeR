library(OjaNP)


### Name: ojaCsampleTest
### Title: C Sample Location Test Based on Oja Signs and Ranks
### Aliases: ojaCsampleTest ojaCsampleTest.default ojaCsampleTest.formula
### Keywords: htest multivariate nonparametric

### ** Examples

data(biochem)
X <- subset(biochem, group=="Control", select=c("comp.1","comp.2"))
Y <- subset(biochem, group=="Treat", select=c("comp.1","comp.2"))
ojaCsampleTest(X,Y, alg="exact")
ojaCsampleTest(X,Y, method="p", alg="exact")
ojaCsampleTest(cbind(comp.1, comp.2) ~ group, score="r", data=biochem)



