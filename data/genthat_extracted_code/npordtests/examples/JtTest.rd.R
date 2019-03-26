library(npordtests)


### Name: JtTest
### Title: Jonckheere-Terpstra (JT) Test
### Aliases: JtTest
### Keywords: functions

### ** Examples


library(npordtests)

## Data from Jonckheere (1954)

X<-as.factor(c(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4))
Y<-c(19,20,60,130,21,61,80,129,40,99,100,149,49,110,151,160)
data<-cbind.data.frame(X,Y)
JtTest(Y~X,data)




