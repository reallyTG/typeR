library(agricolae)


### Name: sp.plot
### Title: Splip-Plot analysis
### Aliases: sp.plot
### Keywords: models

### ** Examples

library(agricolae)
data(plots)
model<-with(plots,sp.plot(block,A,B,yield))
# with aov
plots[,1]<-as.factor(plots[,1])
AOV <- aov(yield ~ block + A*B + Error(block/A),data=plots)
summary(AOV)



