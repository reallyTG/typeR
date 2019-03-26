library(FSA)


### Name: agePrecision
### Title: Compute measures of precision among sets of ages.
### Aliases: agePrecision plot.agePrec summary.agePrec
### Keywords: htest manip

### ** Examples

## Example with just two age estimates
ap1 <- agePrecision(~otolithC+scaleC,data=WhitefishLC)
summary(ap1)
summary(ap1,what="precision")
summary(ap1,what="difference")
summary(ap1,what="difference",percent=FALSE)
summary(ap1,what="absolute")
summary(ap1,what="absolute",percent=FALSE)
summary(ap1,what="absolute",trunc.diff=4)
summary(ap1,what=c("precision","difference"))
summary(ap1,what="detail")

barplot(ap1$rawdiff,ylab="Frequency",xlab="Otolith - Scale Age")
plot(AD~mean,data=ap1$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Mean Age",ylab="Absolute Deviation Age")
plot(SD~mean,data=ap1$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Mean Age",ylab="Standard deviation Age")
plot(SD~AD,data=ap1$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Absolute Deviation Age",ylab="Standard deviation Age")
plot(CV~PE,data=ap1$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Percent Error Age",ylab="Coefficient of Variation Age")

## Example with three age estimates
ap2 <- agePrecision(~otolithC+finrayC+scaleC,data=WhitefishLC)
summary(ap2,digits=3)
summary(ap2,what="precision")
summary(ap2,what="difference")
summary(ap2,what="absolute",percent=FALSE,trunc.diff=4)
summary(ap2,what="detail",digits=3)

plot(AD~mean,data=ap2$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Mean Age",ylab="Absolute Deviation Age")
plot(SD~mean,data=ap2$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Mean Age",ylab="Standard Deviation Age")
plot(SD~AD,data=ap2$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Absolute Deviation Age",ylab="Standard Deviation Age")
plot(CV~PE,data=ap2$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Percent Error Age",ylab="Coefficient of Variation Age")
plot(median~mean,data=ap2$detail,pch=19,col=col2rgbt("black",1/5),
     xlab="Mean Age",ylab="Median Age")




