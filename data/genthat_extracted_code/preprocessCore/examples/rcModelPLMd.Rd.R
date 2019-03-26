library(preprocessCore)


### Name: rcModelPLMd
### Title: Fit robust row-column models to a matrix
### Aliases: rcModelPLMd
### Keywords: models

### ** Examples

col.effects <- c(10,11,10.5,12,9.5)
row.effects <- c(seq(-0.5,-0.1,by=0.1),seq(0.1,0.5,by=0.1))


y <- outer(row.effects, col.effects,"+")
y <- y + rnorm(50,sd=0.1)

rcModelPLMd(y,group.labels=c(1,1,2,2,2))


row.effects <- c(4,3,2,1,-1,-2,-3,-4)
col.effects  <- c(8,9,10,11,12,10)

y <- outer(row.effects, col.effects,"+") + rnorm(48,0,0.25)

y[8,4:6] <- c(11,12,10)+ 2.5 + rnorm(3,0,0.25)
y[5,4:6] <- c(11,12,10)+-2.5 + rnorm(3,0,0.25)


rcModelPLMd(y,group.labels=c(1,1,1,2,2,2))

par(mfrow=c(2,2))
matplot(y,type="l",col=c(rep("red",3),rep("blue",3)),ylab="residuals",xlab="probe",main="Observed Data")
matplot(rcModelPLM(y)$Residuals,col=c(rep("red",3),rep("blue",3)),ylab="residuals",xlab="probe",main="Residuals (PLM)")
matplot(rcModelPLMd(y,group.labels=c(1,1,1,2,2,2))$Residuals,col=c(rep("red",3),rep("blue",3)),xlab="probe",ylab="residuals",main="Residuals (PLM-d)")




