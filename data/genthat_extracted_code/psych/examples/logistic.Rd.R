library(psych)


### Name: logistic
### Title: Logistic transform from x to p and logit transform from p to x
### Aliases: logistic logit logistic.grm
### Keywords: multivariate

### ** Examples

curve(logistic(x,a=1.702),-3,3,ylab="Probability of x",
 main="Logistic transform of x",xlab="z score units") 
 #logistic with a=1.702 is almost the same as pnorm 
 
curve(pnorm(x),add=TRUE,lty="dashed")  
curve(logistic(x),add=TRUE)
text(2,.8, expression(alpha ==1))
text(2,1.0,expression(alpha==1.7))
curve(logistic(x),-4,4,ylab="Probability of x",
            main = "Logistic transform of x in logit units",xlab="logits")
curve(logistic(x,d=-1),add=TRUE)
curve(logistic(x,d=1),add=TRUE)
curve(logistic(x,c=.2),add=TRUE,lty="dashed")
text(1.3,.5,"d=1")
text(.3,.5,"d=0")
text(-1.5,.5,"d=-1")
text(-3,.3,"c=.2")
#demo of graded response model
 curve(logistic.grm(x,r=1),-4,4,ylim=c(0,1),main="Five level response scale",
           ylab="Probability of endorsement",xlab="Latent attribute on logit scale")
 curve(logistic.grm(x,r=2),add=TRUE)
 curve(logistic.grm(x,r=3),add=TRUE)
 curve(logistic.grm(x,r=4),add=TRUE)
 curve(logistic.grm(x,r=5),add=TRUE)
 
 text(-2.,.5,1)
 text(-1.,.4,2)
 text(0,.4,3)
 text(1.,.4,4)
  text(2.,.4,5)



