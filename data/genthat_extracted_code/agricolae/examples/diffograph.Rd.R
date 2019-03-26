library(agricolae)


### Name: diffograph
### Title: Plotting the multiple comparison of means
### Aliases: diffograph
### Keywords: aplot

### ** Examples

# Example 1
library(agricolae)
data(sweetpotato)
model<-aov(yield~virus,data=sweetpotato)
x<- LSD.test(model,"virus",alpha=0.01,group=FALSE)
diffograph(x,cex.axis=0.8,xlab="Yield",ylab="")
# Example 2
x<- REGW.test(model,"virus",alpha=0.01,group=FALSE)
diffograph(x,cex.axis=0.6,xlab="Yield",ylab="",color1="brown",color2="green")



