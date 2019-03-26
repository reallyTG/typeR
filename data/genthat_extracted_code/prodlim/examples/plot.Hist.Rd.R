library(prodlim)


### Name: plot.Hist
### Title: Box-arrow diagrams for multi-state models.
### Aliases: plot.Hist
### Keywords: survival

### ** Examples



## A simple survival model

SurvFrame <- data.frame(time=1:10,status=c(0,1,1,0,0,1,0,0,1,0))
SurvHist <- with(SurvFrame,Hist(time,status))
plot(SurvHist)
plot(SurvHist,box2.col=2,box2.label="experienced\nR user")
plot(SurvHist,
     box2.col=2,
     box1.label="newby",
     box2.label="experienced\nR user",
     oneFitsAll=FALSE,
     arrow1.length=.5,
     arrow1.label="",
     arrow1.lwd=4)

## change the cex of all box labels:
plot(SurvHist,
     box2.col=2,
     box1.label="newby",
     box2.label="experienced\nR user",
     oneFitsAll=FALSE,
     arrow1.length=.5,
     arrow1.label="",
     arrow1.lwd=4,
     label.cex=1)

## change the cex of single box labels:
plot(SurvHist,
     box2.col=2,
     box1.label="newby",
     box2.label="experienced\nR user",
     oneFitsAll=FALSE,
     arrow1.length=.5,
     arrow1.label="",
     arrow1.lwd=4,
     label1.cex=1,
     label2.cex=2)


## The pbc data set from the survival package
library(survival)
data(pbc)
plot(with(pbc,Hist(time,status)),
     stateLabels=c("randomized","transplant","dead"),
     arrowLabelStyle="count")

## two competing risks
comprisk.model <- data.frame(time=1:3,status=1:3)
CRHist <- with(comprisk.model,Hist(time,status,cens.code=2))
plot(CRHist)
plot(CRHist,arrow1.label=paste(expression(eta(s,u))))

plot(CRHist,box2.label="This\nis\nstate 2",arrow1.label=paste(expression(gamma[1](t))))
plot(CRHist,box3.label="Any\nLabel",arrow2.label="any\nlabel")

## change the layout
plot(CRHist,
     box1.label="Alive",
     box2.label="Dead\n cause 1",
     box3.label="Dead\n cause 2",
     arrow1.label=paste(expression(gamma[1](t))),
     arrow2.label=paste(expression(eta[2](t))),
     box1.col=2,
     box2.col=3,
     box3.col=4,
     nrow=2,
     ncol=3,
     box1.row=1,
     box1.column=2,
     box2.row=2,
     box2.column=1,
     box3.row=2,
     box3.column=3)

## more competing risks
comprisk.model2 <- data.frame(time=1:4,status=1:4)
CRHist2 <- with(comprisk.model2,Hist(time,status,cens.code=2))
plot(CRHist2,box1.row=2)

## illness-death models
illness.death.frame <- data.frame(time=1:4,
				  from=c("Disease\nfree",
                                      "Disease\nfree",
                                      "Diseased",
                                      "Disease\nfree"),
				  to=c("0","Diseased","Dead","Dead"))
IDHist <- with(illness.death.frame,Hist(time,event=list(from,to)))
plot(IDHist)

## illness-death with recovery
illness.death.frame2 <- data.frame(time=1:5,
from=c("Disease\nfree","Disease\nfree","Diseased","Diseased","Disease\nfree"),
to=c("0","Diseased","Disease\nfree","Dead","Dead"))
IDHist2 <- with(illness.death.frame2,Hist(time,event=list(from,to)))
plot(IDHist2)

## 4 state models
x=data.frame(from=c(1,2,1,3,4),to=c(2,1,3,4,1),time=1:5)
y=with(x,Hist(time=time,event=list(from=from,to=to)))
plot(y)

## moving the label of some arrows

d <- data.frame(time=1:5,from=c(1,1,1,2,2),to=c(2,3,4,3,4))
h <- with(d,Hist(time,event=list(from,to)))
plot(h,
tagBoxes=TRUE,
stateLabels=c("Remission\nwithout\nGvHD",
    "Remission\nwith\nGvHD",
    "Relapse",
    "Death\nwithout\nrelapse"),
arrowLabelSymbol='alpha',
arrowlabel3.x=35,
arrowlabel3.y=53,
arrowlabel4.y=54,
arrowlabel4.x=68)

##'



