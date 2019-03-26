library(MCPAN)


### Name: HCD
### Title: Hell Creek Dinosaur Data
### Aliases: HCD
### Keywords: datasets

### ** Examples


data(HCD)
str(HCD)
HCD

mat<-as.matrix(HCD[,-c(1)])

rownames(mat)<-HCD$Level

mosaicplot(mat, las=1)

estSimpsonf(X=HCD[,-c(1)], f=HCD$Level)

estShannonf(X=HCD[,-c(1)], f=HCD$Level)




