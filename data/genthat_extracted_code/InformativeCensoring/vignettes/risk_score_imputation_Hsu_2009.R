## ----echo=FALSE,fig.cap="Kaplan-Meier Imputation. In this example, for the KM curve shown, we sampled $U=0.75$ and this implies an imputed event time of 40. If $U$ is less than any value on the KM curve (e.g. if $U=0.1$ in this example) then the subject's imputed time is the last censored time of the risk set (in this example time 60) and the subject is censored rather than having an event at this time."----
library("survival")
my.df <- data.frame(time=c(20,30,40,50,60),event=c(1,0,1,0,0))
plot(survfit(Surv(time,event)~1,data=my.df,conf.int=FALSE),xlab="Time")
arrows(x0=0,y0=0.75,x1=40,y1=0.75,col="red",lty=2)
arrows(x0=40,y0=0.75,x1=40,y1=0,col="red",lty=2)
mtext(text = "U",side = 2,at=0.75,col="red")

## ----loadpackage,message=FALSE-------------------------------------------
library(InformativeCensoring)
set.seed(421234)

## ----loaddata------------------------------------------------------------
data(ScoreInd)

head(ScoreInd)

## ----factor--------------------------------------------------------------
ScoreInd$arm <- factor(ScoreInd$arm)

levels(ScoreInd$arm)

## ------------------------------------------------------------------------
col.control <- col.headings(has.event="event", time="time",Id="Id",arm="arm",
                            DCO.time="DCO.time", to.impute="to.impute")

## ------------------------------------------------------------------------
imputed.data.sets <- ScoreImpute(data=ScoreInd,event.model=~Z1+Z2+Z3+Z4+Z5,
                                 col.control=col.control, m=5,
                                 bootstrap.strata=ScoreInd$arm,
                                 NN.control=NN.options(NN=5,w.censoring = 0.2))

## ------------------------------------------------------------------------
#for the third data set
imputed.data.set <- ExtractSingle(imputed.data.sets,index=3)

## ------------------------------------------------------------------------
head(imputed.data.set$data)

## ----fit-----------------------------------------------------------------
logrank.fits <- ImputeStat(imputed.data.sets,method="logrank",
                           formula=~arm+strata(Z1,Z3))

third.fit <- ExtractSingle(logrank.fits,index=3) #view log rank fit for third data set
print(third.fit)

## ------------------------------------------------------------------------
Cox.fits <- ImputeStat(imputed.data.sets,method="Cox",
                   formula=~arm+Z1+Z2+Z3+Z4+Z5)

ExtractSingle(Cox.fits,index=3)$model

## ------------------------------------------------------------------------
Cox.fits$statistics

## ------------------------------------------------------------------------
final.answer <- summary(Cox.fits)

print(final.answer)

#can access individual elements of the summary
cat("log HR estimate:", final.answer$meth1$estimate)

## ------------------------------------------------------------------------
confint(final.answer, level=0.95)

## ------------------------------------------------------------------------
ScoreInd$Ctype <- 1 - ScoreInd$event
ScoreInd$Ctype[ScoreInd$Id %in% c(2,3)] <- 2

## ------------------------------------------------------------------------
col.control.a.censor <- col.headings(has.event="event",time="time",Id="Id",
                            arm="arm",DCO.time="DCO.time",
                            to.impute="to.impute",
                            censor.type="Ctype") #Note new arg

## ------------------------------------------------------------------------
with.a.censor <- ScoreImpute(data=ScoreInd,m=5,
                event.model=~Z1+Z2+Z3+Z4+Z5,
                censor.model=~Z1+Z3+Z5,
                bootstrap.strata=ScoreInd$arm,
                col.control=col.control.a.censor,
                NN.control=NN.options(NN=5,w.censoring = 0.2))

## ------------------------------------------------------------------------
data(ScoreTimeDep)

head(ScoreTimeDep)

## ------------------------------------------------------------------------
time.dep <- MakeTimeDepScore(ScoreTimeDep,Id="Id",
                            time.start="start",
                            time.end="end")

head(time.dep)

## ------------------------------------------------------------------------
imputed.data.with.td <- ScoreImpute(data=ScoreInd,
                            m=5, bootstrap.strata=ScoreInd$arm,
                            event.model=~Z1+ridge(W2,theta=1), #Note the W2 and
                            censor.model=~Z2+ridge(W2,theta=1),  #ridge here
                            col.control=col.control,
                            NN.control=NN.options(NN=12,w.censoring = 0.2,
                                                  min.subjects=35), #min.subjects argument
                            time.dep=time.dep) #key argument

