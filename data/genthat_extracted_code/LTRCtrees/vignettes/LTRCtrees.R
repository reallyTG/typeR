## ------------------------------------------------------------------------
 ## Adjust data & clean data
 library(survival)
 set.seed(0)
 ## Since LTRCART uses cross-validation to prune the tree, specifying the seed 
 ## guarantees that the results given here will be duplicated in other analyses
 Data <- flchain
 Data <- Data[!is.na(Data$creatinine),]
 Data$End <- Data$age + Data$futime/365
 DATA <- Data[Data$End > Data$age,]
 names(DATA)[6] <- "FLC"

## ------------------------------------------------------------------------
 ## Setup training set and test set
 Train = DATA[1:500,]
 Test = DATA[1000:1020,]

## ---- fig.show='hold', fig.width = 3.4, fig.height = 4.5,warning = FALSE----
 ## Fit LTRCART and LTRCIT survival tree
 library(LTRCtrees)
 LTRCART.obj <- LTRCART(Surv(age, End, death) ~ sex + FLC + creatinine, Train)
 LTRCIT.obj <- LTRCIT(Surv(age, End, death) ~ sex + FLC + creatinine, Train)
 
 ## Putting Surv(End, death) in formula would result an error message
 ## since both LTRCART and LTRCIT are expecting Surv(time1, time2, event)
 
 ## Plot the fitted LTRCART tree using rpart.plot function in rpart.plot[6] package
 library(rpart.plot)
 rpart.plot.version1(LTRCART.obj)

 ## Plot the fitted LTRCIT tree
 plot(LTRCIT.obj)

## ----fig.show='hold', fig.width = 7, fig.height = 5,warning = FALSE------
library(partykit)
LTRCART.obj.party <- as.party(LTRCART.obj) 
LTRCART.obj.party$fitted[["(response)"]]<- Surv(Train$age, Train$End, Train$death)
plot(LTRCART.obj.party)

## ------------------------------------------------------------------------
 ## predict median survival time on test data using fitted LTRCIT tree
 LTRCIT.pred <- predict(LTRCIT.obj, newdata=Test, type = "response")
 head(LTRCIT.pred)

 ## predict Kaplan Meier survival curve on test data
 ## return a list of survfit objects -- the predicted KM curves
 LTRCIT.pred <- predict(LTRCIT.obj, newdata=Test, type = "prob")
 head(LTRCIT.pred,2)

## ------------------------------------------------------------------------
## Predict relative risk on test set
LTRCART.pred <- predict(LTRCART.obj, newdata=Test)
head(LTRCART.pred)

## ------------------------------------------------------------------------
## Predict median survival time and Kaplan Meier survival curve
## on test data using Pred.rpart
LTRCART.pred <- Pred.rpart(Surv(age, End, death) ~ sex + FLC + creatinine, Train, Test)
head(LTRCART.pred$KMcurves, 2)  ## list of predicted KM curves
head(LTRCART.pred$Medians)  ## vector of predicted median survival time

## ---- echo=FALSE,results='hide'------------------------------------------
Patient.ID <- c(1,1,1,2,2)
Sex <- c('F', 'F', 'F', 'M', 'M')
Blood.pressure <- c(100,89, 120, 110, 105)
Start <- c(0,10,20,0,10)
End <- c(10,20,27,10,19)
Death <- c(0,0,1,0,0)
table1 <- cbind(Patient.ID , Sex, Blood.pressure,Start, End, Death)
Table <- as.data.frame(table1)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(Table)

## ----fig.show='hold', fig.width = 7, fig.height = 5,warning = FALSE------
set.seed(0)
library(survival)
## Create the start-stop-event triplet needed for coxph and LTRC trees
first <- with(pbcseq, c(TRUE, diff(id) !=0)) #first id for each subject
last <- c(first[-1], TRUE) #last id
time1 <- with(pbcseq, ifelse(first, 0, day))
time2 <- with(pbcseq, ifelse(last, futime, c(day[-1], 0)))
event <- with(pbcseq, ifelse(last, status, 0))
event <- 1*(event==2)

pbcseq$time1 <- time1
pbcseq$time2 <- time2
pbcseq$event <-  event

## Fit the Cox model and LTRC trees with time-varying covariates
fit.cox <- coxph(Surv(time1, time2, event) ~ age + sex + log(bili), pbcseq)
LTRCIT.fit <- LTRCIT(Surv(time1, time2, event) ~ age + sex + log(bili), pbcseq)
LTRCART.fit <- LTRCART(Surv(time1, time2, event) ~ age + sex + log(bili), pbcseq)

## Result of the Cox model with time-varying covariates
fit.cox 

## plots of fitted survival trees with time-varying covariates
rpart.plot.version1(LTRCART.fit,type=0)
plot(LTRCIT.fit)

## ----fig.show='hold', fig.width = 3.4, fig.height = 4,warning = FALSE----
library(survival)
### transform the wide format data into the long format data using tmerge function
### from survival package on Stanford Heart Transplant data
jasa$subject <- 1:nrow(jasa)

tdata <- with(jasa, data.frame(subject = subject,
	futime= pmax(.5, fu.date - accept.dt),
	txtime= ifelse(tx.date== fu.date,
	(tx.date -accept.dt) -.5,
	(tx.date - accept.dt)),
	fustat = fustat))

sdata <- tmerge(jasa, tdata, id=subject,death = event(futime, fustat),trt = tdc(txtime), options= list(idname="subject"))

sdata$age <- sdata$age - 48

sdata$year <- as.numeric(sdata$accept.dt - as.Date("1967-10-01"))/365.25

Cox.fit <- coxph(Surv(tstart, tstop, death) ~ age+ surgery, data= sdata)
LTRCART.fit <- LTRCART(Surv(tstart, tstop, death) ~ age + transplant, data = sdata)
LTRCIT.fit <- LTRCIT(Surv(tstart, tstop, death) ~ age + transplant, data = sdata)

## results
Cox.fit
rpart.plot.version1(LTRCART.fit)
plot(LTRCIT.fit)

## ----fig.show='hold', fig.width = 7, fig.height = 5,warning = FALSE------
library(interval)
data(bcos)

## Fit ICtree survival tree
Ctree <- ICtree(Surv(left,right,type="interval2")~treatment, bcos)

## Plot the fitted tree
plot(Ctree)

