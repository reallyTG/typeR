library(catseyes)


### Name: catseyesplot
### Title: catseyesplot
### Aliases: catseyesplot

### ** Examples

#Show catseye plots for 4 groups with means of c(-3,2,-1,6)
#    and standard errors of c(1,2,4,3)
catseyesplot(1:4,ymean=c(-3,2,-1,6),yse=c(1,2,4,3),xlab="",ylab="",main="4 Groups",xaxt="n")
axis(1,at=1:4,labels = c("Group1","Group2","Group3","Group4"))
#Optionally, add points and lines (usually lines only when joining time sequence)
lines(1:4,c(-3,2,-1,6),type="b")

#Using the labels option
catseyesplot(1:4,ymean=c(-3,2,-1,6),yse=c(1,2,4,3),xlab="",ylab="",labels =
     c("Group A","Group B","Group C","Group D"))
catseyesplot(1:4,ymean=c(-3,2,-1,6),yse=c(1,2,4,3),xlab="",ylab="",labels = TRUE)

#Demontration of inclusion of scatterplots
datTest=data.frame(x=c(rep(1,10),rep(2,10),rep(3,10)),y=rnorm(10,30))
datTest$y[datTest$x==2]=datTest$y[datTest$x==2]+7
datTest$y[datTest$x==3]=datTest$y[datTest$x==3]+5
means=c(mean(datTest$y[datTest$x==1]),mean(datTest$y[datTest$x==2]),
     mean(datTest$y[datTest$x==3]))
ses=c(sd(datTest$y[datTest$x==1]),sd(datTest$y[datTest$x==2]),
     sd(datTest$y[datTest$x==3]))/sqrt(10)

catseyesplot(1:3,ymean=means,yse=ses,xlab="Group",ylab="",x_scatter = datTest$x,
     y_scatter = datTest$y)
catseyesplot(1:3,ymean=means,yse=ses,xlab="Group",ylab="",x_scatter = datTest$x,
     y_scatter = datTest$y,jitter_scatter = TRUE,xaxt="n")
axis(1,at=1:3,labels = c("Group1","Group2","Group3"))

#Demonstration of plotting of factor estimates by direct prediction from lm model
datTest$x=factor(datTest$x)
lm1=lm(y~x,data=datTest)
newdata=data.frame(x=c("1","2","3"))
pred_lm=predict(lm1,se.fit = TRUE,newdata=newdata,type="response")
catseyesplot(1:3,ymean=pred_lm$fit,yse=pred_lm$se.fit,xlab="Group",ylab="",
     x_scatter = datTest$x,y_scatter = datTest$y,jitter_scatter = TRUE,xaxt="n")

#Demonstration of plotting of factor estimates from emmeans package
require(emmeans)
emmeans1=emmeans(lm1,~x)
#Assess differences between levels of x
pairs(emmeans1,adjust="tukey")
preds=confint(emmeans1)
catseyesplot(1:3,ymean=preds$emmean,yse=preds$SE,xlab="Group",ylab="",
     x_scatter = datTest$x,y_scatter = datTest$y,jitter_scatter = TRUE,xaxt="n")
#Plot with variable x positions
catseyesplot(c(1,3.5,5),ymean=pred_lm$fit,yse=pred_lm$se.fit,xlab="Group",
     ylab="",x_scatter = datTest$x,y_scatter = datTest$y,jitter_scatter = TRUE,xaxt="n")

#Demonstrate use of transformation function fTransform
#Create skewed y
datTest=data.frame(x=c(rep(1,10),rep(2,10),rep(3,10)),y=rnorm(30,mean=0))
datTest$y[datTest$x==2]=datTest$y[datTest$x==2]+1
datTest$y[datTest$x==3]=datTest$y[datTest$x==3]+.5
datTest$y=exp(datTest$y)#Create skewed y
datTest$log_y=log(datTest$y+1)#Transform skewed y to normal distribution for analysis
qqnorm(datTest$y)
qqnorm(datTest$log_y)
plot(datTest$x,datTest$y)
plot(datTest$x,datTest$log_y)
means=c(mean(datTest$log_y[datTest$x==1]),mean(datTest$log_y[datTest$x==2]),
     mean(datTest$log_y[datTest$x==3]))
ses=c(sd(datTest$log_y[datTest$x==1]),sd(datTest$log_y[datTest$x==2]),
     sd(datTest$log_y[datTest$x==3]))/sqrt(10)
#Plot on log scale
catseyesplot(1:3,ymean=means,yse=ses,xlab="Group",ylab="",x_scatter = datTest$x,
     y_scatter = datTest$log_y,jitter_scatter = TRUE,xaxt="n",yaxt="n")
axis(2,at=log(c(0,1,2,4,8,16)+1),labels = c(0,1,2,4,8,16))
#Show catseye plot on original (skewed) scale
#Define function to invert data from log_y scale to y scale
fInvertLog<-function(y_vals) {exp(y_vals)-1}
catseyesplot(1:3,ymean=means,yse=ses,xlab="Group",ylab="",x_scatter = datTest$x,
     y_scatter = datTest$y,jitter_scatter = TRUE,xaxt="n",fTransform=fInvertLog)
axis(1,at=1:3,labels = c("Group1","Group2","Group3"))

#Logistic regression example (2 groups)
set.seed(3333)
datBin=data.frame(Group=factor(c(rep("A",15),rep("B",15))),
                  Y=c(rbinom(15,1,.8),rbinom(15,1,.5)))
sum(datBin$Y[datBin$Group=="A"])/sum(datBin$Group=="A")
sum(datBin$Y[datBin$Group=="B"])/sum(datBin$Group=="B")
glm1=glm(Y~Group-1,family = binomial,data=datBin)
summary(glm1)
(smr=coefficients(summary(glm1)))
#Plot Results on logit=log(odds) Scale
catseyesplot(1:2,smr[,1],smr[,2],xaxt="n",ylab="log(odds)",xlab="Group")
axis(1,at=c(1,2),labels = c("A","B"))
#Plot Results on Probability Scale
fInvLogit<-function(yy) {exp(yy)/(1+exp(yy))}
catseyesplot(1:2,smr[,1],smr[,2],xaxt="n",ylab="Probability",xlab="Group",
     fTransform = fInvLogit,ylim=c(0,1))
axis(1,at=c(1,2),labels = c("A","B"))



