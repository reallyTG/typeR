library(CUB)


### Name: logscore
### Title: Logarithmic score
### Aliases: logscore
### Keywords: htest

### ** Examples

data(relgoods)
m<-10
naord<-which(is.na(relgoods$Walking))
nacovpai<-which(is.na(relgoods$Gender))
nacovcsi<-which(is.na(relgoods$Smoking))
na<-union(naord,union(nacovpai,nacovcsi))
ordinal<-relgoods$Walking[-na]
Y<-relgoods$Gender[-na]
W<-relgoods$Smoking[-na]
bet<-c(-0.45,-0.48)
gama<-c(-0.55,-0.43)
logscore(m,ordinal,Y=Y,W=W,bet,gama)



