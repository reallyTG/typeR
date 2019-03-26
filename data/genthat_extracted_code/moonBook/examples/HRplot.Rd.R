library(moonBook)


### Name: HRplot
### Title: Draw a hazard ratio plot
### Aliases: HRplot

### ** Examples

require(survival)
attach(colon)
colon$TS=Surv(time,status==1)
out=mycph(TS~.,data=colon)
out
HRplot(out,type=1,pch=2,col=c("blue","red"))
HRplot(out,type=2,show.CI=TRUE,pch=2,cex=2,main="Hazard ratios of all individual variables")




