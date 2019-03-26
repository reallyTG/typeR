library(processR)


### Name: changeLabelName
### Title: Change Label Names
### Aliases: changeLabelName

### ** Examples

labels=list(X="skeptic",Mi="empathy",Y="intervention",W="frame")
x=c("skeptic","test","empathy","skeptic:frame","D1:frame")
changeLabelName(x,labels)
changeLabelName(x,labels,add=TRUE)



