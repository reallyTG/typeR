library(moonBook)


### Name: ORplot
### Title: Plot for odds ratios for a S3 object of glm
### Aliases: ORplot

### ** Examples

require(survival)
data(colon)
out1=glm(status~sex+age+rx+obstruct+node4,data=colon)
out2=glm(status~rx+node4,data=colon)
ORplot(out1,type=2,show.CI=TRUE,xlab="This is xlab",main="Main Title")
ORplot(out2,type=1,main="Main Title")
ORplot(out1,type=2,show.CI=TRUE,main="Main Title")
ORplot(out1,type=3,show.CI=TRUE,main="Main Title",sig.level=0.05)
ORplot(out1,type=3,show.CI=TRUE,main="Main Title",sig.level=0.05,
       pch=1,cex=2,lwd=4,col=c("red","blue"))



