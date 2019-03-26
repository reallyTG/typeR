library(SNSequate)


### Name: lin.eq
### Title: The linear method of equating
### Aliases: lin.eq lin.eq.default
### Keywords: Traditional equating methods

### ** Examples

#Artificial data for two two 100 item tests forms and 5 individuals in each group
x1<-c(67,70,77,79,65,74)
y1<-c(77,75,73,89,68,80)

#Score means and sd
mean(x1); mean(y1)
sd(x1); sd(y1)

#An equivalent form y1 score of 72 on form x1
lin.eq(x1,y1,72)

#Equivalent form y1 score for the whole scale range
lin.eq(x1,y1,0:100)

#A plot comparing mean, linear and identity equating
plot(0:100,0:100, type='l', xlim=c(-20,100),ylim=c(0,100),lwd=2.0,lty=1,
ylab="Form Y raw score",xlab="Form X raw score")
abline(a=5,b=1,lwd=2,lty=2)
abline(a=mean(y1)-(sd(y1)/sd(x1))*mean(x1),b=sd(y1)/sd(x1),,lwd=2,lty=3)
arrows(72, 0, 72, 77,length = 0.15,code=2,angle=20)
arrows(72, 77, -20, 77,length = 0.15,code=2,angle=20)
abline(v=0,lty=2)
legend("bottomright",lty=c(1,2,3), c("Identity","Mean","Linear"),lwd=c(2,2,2))




