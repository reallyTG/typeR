library(NSM3)


### Name: HollBivSym
### Title: Hollander Bivariate Symmetry
### Aliases: HollBivSym
### Keywords: Hollander

### ** Examples


##Hollander-Wolfe-Chicken Table 3.16 example
recipient<-c(61.4,63.3,63.7,80,77.3,84,105)
donor<-c(70.8,89.2,65.8,67.1,87.3,85.1,88.1)

HollBivSym(recipient,donor)

##Or, equivalently
table3.16<-matrix(c(61.4,63.3,63.7,80,77.3,84,105,70.8,89.2,65.8,67.1,87.3,85.1,88.1),ncol=2)
HollBivSym(table3.16)



