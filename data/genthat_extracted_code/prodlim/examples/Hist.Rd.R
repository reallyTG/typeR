library(prodlim)


### Name: Hist
### Title: Create an event history response variable
### Aliases: Hist
### Keywords: survival

### ** Examples



## Right censored responses of a two state model
## ---------------------------------------------

Hist(time=1:10,event=c(0,1,0,0,0,1,0,1,0,0))

## change the code for events and censored observations

Hist(time=1:10,event=c(99,"event",99,99,99,"event",99,"event",99,99),cens.code=99)

TwoStateFrame <- SimSurv(10)
SurvHist <- with(TwoStateFrame,Hist(time,status))
summary(SurvHist)
plot(SurvHist)

## Right censored data from a competing risk model
## --------------------------------------------------

CompRiskFrame <- data.frame(time=1:10,event=c(1,2,0,3,0,1,2,1,2,1))
CRHist <- with(CompRiskFrame,Hist(time,event))
summary(CRHist)
plot(CRHist)

## Interval censored data from a survival model
icensFrame <- data.frame(L=c(1,1,3,4,6),R=c(2,NA,3,6,9),event=c(1,1,1,2,2))
with(icensFrame,Hist(time=list(L,R)))

## Interval censored data from a competing risk model
with(icensFrame,Hist(time=list(L,R),event))

## Multi state model
MultiStateFrame <- data.frame(time=1:10,
			      from=c(1,1,3,1,2,4,1,1,2,1),
			      to=c(2,3,1,2,4,2,3,2,4,4))
with(MultiStateFrame,Hist(time,event=list(from,to)))

##  MultiState with right censored observations

MultiStateFrame1 <- data.frame(time=1:10,
			      from=c(1,1,3,2,1,4,1,1,3,1),
			      to=c(2,3,1,0,2,2,3,2,0,4))
with(MultiStateFrame1,Hist(time,event=list(from,to)))

## Using the longitudinal input method 
MultiStateFrame2 <- data.frame(time=c(0,1,2,3,4,0,1,2,0,1),
			      event=c(1,2,3,0,1,2,4,2,1,2),
			      id=c(1,1,1,1,2,2,2,2,3,3))
 with(MultiStateFrame2,Hist(time,event=event,id=id))




