library(agricolae)


### Name: audps
### Title: The Area Under the Disease Progress Stairs
### Aliases: audps
### Keywords: manip

### ** Examples

library(agricolae)
dates<-c(14,21,28) # days
# example 1: evaluation - vector
evaluation<-c(40,80,90)
audps(evaluation,dates)
audps(evaluation,dates,"relative")
x<-seq(10.5,31.5,7)
y<-c(40,80,90,90)
plot(x,y,"s",ylim=c(0,100),xlim=c(10,32),axes=FALSE,col="red" ,ylab="",xlab="")
title(cex.main=0.8,main="Absolute or Relative AUDPS\nTotal area=(31.5-10.5)*100=2100",
ylab="evaluation",xlab="dates" )
points(x,y,type="h")
z<-c(14,21,28)
points(z,y[-3],col="blue",lty=2,pch=19)
points(z,y[-3],col="blue",lty=2,pch=19)
axis(1,x,pos=0)
axis(2,c(0,40,80,90,100),las=2)
text(dates,evaluation+5,dates,col="blue")
text(14,20,"A = (17.5-10.5)*40",cex=0.8)
text(21,40,"B = (24.5-17.5)*80",cex=0.8)
text(28,60,"C = (31.5-24.5)*90",cex=0.8)
text(14,95,"audps = A+B+C = 1470")
text(14,90,"relative = audps/area = 0.7")
# It calculates audpc absolute
absolute<-audps(evaluation,dates,type="absolute")
print(absolute)
rm(evaluation, dates, absolute)



