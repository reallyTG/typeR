### R code from vignette source 'PRROC.Rnw'

###################################################
### code chunk number 1: PRROC.Rnw:33-35
###################################################
library(PRROC)
set.seed(127)


###################################################
### code chunk number 2: PRROC.Rnw:47-49
###################################################
fg<-rnorm(300);
bg<-rnorm(500,-2);


###################################################
### code chunk number 3: PRROC.Rnw:55-57
###################################################
roc<-roc.curve(scores.class0 = fg, scores.class1 = bg)
pr<-pr.curve(scores.class0 = fg, scores.class1 = bg)


###################################################
### code chunk number 4: PRROC.Rnw:61-62
###################################################
roc


###################################################
### code chunk number 5: PRROC.Rnw:67-68
###################################################
pr


###################################################
### code chunk number 6: PRROC.Rnw:73-75
###################################################
roc<-roc.curve(scores.class0 = fg, scores.class1 = bg, curve = TRUE)
pr<-pr.curve(scores.class0 = fg, scores.class1 = bg, curve = TRUE)


###################################################
### code chunk number 7: PRROC.Rnw:79-81
###################################################
roc
pr


###################################################
### code chunk number 8: roc
###################################################
plot(roc)


###################################################
### code chunk number 9: PRROC.Rnw:92-93
###################################################
plot(roc)


###################################################
### code chunk number 10: pr
###################################################
plot(pr)


###################################################
### code chunk number 11: PRROC.Rnw:104-105
###################################################
plot(pr)


###################################################
### code chunk number 12: PRROC.Rnw:115-117
###################################################
x<-c(fg,bg);
lab<-c(rep(1,length(fg)),rep(0,length(bg)))


###################################################
### code chunk number 13: PRROC.Rnw:122-124
###################################################
roc<-roc.curve(scores.class0 = x, weights.class0 = lab);
pr<-pr.curve(scores.class0 = x, weights.class0 = lab);


###################################################
### code chunk number 14: PRROC.Rnw:129-131
###################################################
roc
pr


###################################################
### code chunk number 15: PRROC.Rnw:146-147
###################################################
wfg<- c(runif(300,min=0.5,max=1),runif(500,min=0,max=0.5))


###################################################
### code chunk number 16: PRROC.Rnw:152-154
###################################################
hist(wfg[301:800],col=2,xlim=c(0,1),main="Weights",xlab="foreground weight");
hist(wfg[1:300],col=3,add=T);


###################################################
### code chunk number 17: PRROC.Rnw:161-163
###################################################
wroc<-roc.curve(scores.class0 = x, weights.class0 = wfg, curve = TRUE)
wpr<-pr.curve(scores.class0 = x, weights.class0 = wfg, curve = TRUE)


###################################################
### code chunk number 18: PRROC.Rnw:169-173
###################################################
wroc<-roc.curve(scores.class0 = x, scores.class1 = x, 
  weights.class0 = wfg, weights.class1 = 1-wfg, curve = TRUE)
wpr<-pr.curve(scores.class0 = x, scores.class1 = x, 
  weights.class0 = wfg,weights.class1 = 1-wfg, curve = TRUE)


###################################################
### code chunk number 19: wroc
###################################################
plot(wroc)


###################################################
### code chunk number 20: PRROC.Rnw:182-183
###################################################
plot(wroc)


###################################################
### code chunk number 21: wpr
###################################################
plot(wpr)


###################################################
### code chunk number 22: PRROC.Rnw:193-194
###################################################
plot(wpr)


###################################################
### code chunk number 23: PRROC.Rnw:203-207
###################################################
wpr<-pr.curve(scores.class0 = x, weights.class0 = wfg, curve = TRUE, 
  max.compute = T, min.compute = T, rand.compute = T)
wroc<-roc.curve(scores.class0 = x, weights.class0 = wfg, curve = TRUE, 
  max.compute = T, min.compute = T, rand.compute = T)


###################################################
### code chunk number 24: PRROC.Rnw:212-214
###################################################
wpr
wroc


###################################################
### code chunk number 25: wpr2
###################################################
plot(wpr,max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, 
  fill.area = TRUE)


###################################################
### code chunk number 26: PRROC.Rnw:225-226
###################################################
plot(wpr,max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, 
  fill.area = TRUE)


###################################################
### code chunk number 27: PRROC.Rnw:233-239
###################################################
y<-c(rnorm(300,sd=2),rnorm(500,-5,sd=2))

wpr2<-pr.curve(scores.class0 = y, weights.class0 = wfg, curve = TRUE, 
  max.compute = TRUE, min.compute = TRUE, rand.compute = TRUE)
wroc2<-roc.curve(scores.class0 = y, weights.class0 = wfg, curve = TRUE, 
  max.compute = TRUE, min.compute = TRUE, rand.compute = TRUE)


###################################################
### code chunk number 28: PRROC.Rnw:244-246
###################################################
plot(wpr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, 
  fill.area = T, color=2, auc.main = FALSE);


###################################################
### code chunk number 29: PRROC.Rnw:250-251
###################################################
plot(wpr2, add = TRUE, color = 3);


###################################################
### code chunk number 30: PRROC.Rnw:256-258
###################################################
plot(wpr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = T, color=2, auc.main = FALSE);
plot(wpr2, add = TRUE, color = 3);


###################################################
### code chunk number 31: plot1
###################################################
plot(wpr,scale.color = heat.colors(100));


###################################################
### code chunk number 32: PRROC.Rnw:274-275
###################################################
plot(wpr,scale.color = heat.colors(100));


###################################################
### code chunk number 33: plot2
###################################################
plot(wpr, auc.main = FALSE, main = "My classifier")


###################################################
### code chunk number 34: PRROC.Rnw:285-286
###################################################
plot(wpr, auc.main = FALSE, main = "My classifier")


###################################################
### code chunk number 35: plot6
###################################################
plot(wpr, legend = FALSE)


###################################################
### code chunk number 36: PRROC.Rnw:296-297
###################################################
plot(wpr, legend = FALSE)


###################################################
### code chunk number 37: plot3
###################################################
plot(wpr, color=3, lty="dotted");


###################################################
### code chunk number 38: PRROC.Rnw:307-308
###################################################
plot(wpr, color=3, lty="dotted");


###################################################
### code chunk number 39: plot4
###################################################
plot(wpr,legend=1);


###################################################
### code chunk number 40: PRROC.Rnw:318-319
###################################################
plot(wpr,legend=1);


###################################################
### code chunk number 41: plot5
###################################################
plot(wpr, rand.plot = TRUE, fill.area = TRUE, 
  fill.color = rgb(0.8,1,0.8), maxminrand.col = "blue" );


###################################################
### code chunk number 42: PRROC.Rnw:330-331
###################################################
plot(wpr, rand.plot = TRUE, fill.area = TRUE, 
  fill.color = rgb(0.8,1,0.8), maxminrand.col = "blue" );


###################################################
### code chunk number 43: PRROC.Rnw:339-340
###################################################
curve.points<-wpr$curve


###################################################
### code chunk number 44: PRROC.Rnw:344-345
###################################################
curve.points[1:5,]


###################################################
### code chunk number 45: plot6
###################################################
plot(curve.points[,1],curve.points[,2],
	 xlab="Recall",ylab="Precision",t="l")


###################################################
### code chunk number 46: PRROC.Rnw:358-359
###################################################
plot(curve.points[,1],curve.points[,2],
	 xlab="Recall",ylab="Precision",t="l")


###################################################
### code chunk number 47: PRROC.Rnw:365-366
###################################################
library(ggplot2)


###################################################
### code chunk number 48: plot7
###################################################
( 
ggplot(data.frame(wpr$curve),aes(x=X1,y=X2,color=X3)) 
	+ geom_line() 
	+ labs(x="Recall",y="Precision",
		   title=format(wpr$auc.integral,digits=3),
		   colour="Threshold") 
	+ scale_colour_gradient2(low="red", mid="orange",high="yellow")
)


###################################################
### code chunk number 49: PRROC.Rnw:381-382
###################################################
( 
ggplot(data.frame(wpr$curve),aes(x=X1,y=X2,color=X3)) 
	+ geom_line() 
	+ labs(x="Recall",y="Precision",
		   title=format(wpr$auc.integral,digits=3),
		   colour="Threshold") 
	+ scale_colour_gradient2(low="red", mid="orange",high="yellow")
)


