## ----setup, include=FALSE------------------------------------------------
library(knitr)
rm(list=ls())

## ----load, echo=TRUE, warning=FALSE, message=FALSE-----------------------
library(lifecontingencies) #load the package

## ----finmat.1------------------------------------------------------------
#interest and discount rates
interest2Discount(i=0.03)
discount2Interest(interest2Discount(i=0.03))
#convertible and effective interest rates
convertible2Effective(i=0.10,k=4)

## ----finmat.2------------------------------------------------------------
annuity(i=0.05,n=5) #due
annuity(i=0.05,n=5,m=1) #immediate
annuity(i=0.05,n=5,k=12) #due, with 
# fractional payemnts

## ----finmat.3------------------------------------------------------------
irate=0.04; term=10
increasingAnnuity(i=irate,n=term)+decreasingAnnuity(i=irate,
n=term)-(term+1)*annuity(i=irate,n=term)

## ----finma.3-------------------------------------------------------------
#bond analysis
irate=0.03
cfs=c(10,10,10,100)
times=1:4
#compute PV, Duration and Convexity
presentValue(cashFlows = cfs, 
timeIds = times, 
interestRates = irate)
duration(cashFlows = cfs, 
timeIds = times, i = irate)
convexity(cashFlows = cfs,
timeIds = times, i = irate)

## ----demo.1--------------------------------------------------------------
data("demoIta")
sim92<-new("lifetable",x=demoIta$X, 
           lx=demoIta$SIM92, name='SIM92')
getOmega(sim92)
tail(sim92)

## ----demo.2--------------------------------------------------------------
#two years death rate
qxt(sim92, x=65,2)
#expected residual lifetime between x and x+n
exn(sim92, x=25,n = 40)

## ----demo.3--------------------------------------------------------------
#simulate 1000 samples of residual life time
res_lt<-rLife(n=1000,object = sim92,x=65)
hist(res_lt,xlab="Residual Life Time")

## ----leecarter01, tidy=FALSE, include=FALSE, results='hide'--------------
#library(demography)
#italy.demo<-hmd.mx("ITA", username="spedicato_giorgio@yahoo.it", password="mortality")

## ----leecarter0, tidy=FALSE, warning=FALSE, message=FALSE----------------
#load the package and the italian tables
library(demography) 
#italyDemo<-hmd.mx("ITA", username="yourUN", 
#password="yourPW")
load(file="mortalityDatasets.RData") #load the dataset

## ----leecarter1, tidy=FALSE, warning=FALSE-------------------------------
#calibrate lee carter
italy.leecarter<-lca(data=italyDemo,series="total",
                     max.age=103,adjust = "none")
#perform modeling of kt series
kt.model<-auto.arima(italy.leecarter$kt)
#projecting the kt
kt.forecast<-forecast(kt.model,h=100) 

## ----leecarter2, tidy=FALSE, size='tiny'---------------------------------
#indexing the kt
kt.full<-ts(union(italy.leecarter$kt, kt.forecast$mean),
            start=1872)  
#getting and defining the life tables matrix
mortalityTable<-exp(italy.leecarter$ax
+italy.leecarter$bx%*%t(kt.full)) 
rownames(mortalityTable)<-seq(from=0, to=103)
colnames(mortalityTable)<-seq(from=1872, 
to=1872+dim(mortalityTable)[2]-1)

## ----leecarter2plot, tidy=FALSE, echo=FALSE------------------------------
plot.ts(kt.full, main="historical and projected KT",xlab="year",
        ylab="kt",col="steelblue")
abline(v=2009,col="darkred",lwd=2.5)

## ----leecarter3, tidy=FALSE----------------------------------------------
getCohortQx<-function(yearOfBirth)
{
  colIndex<-which(colnames(mortalityTable)
                  ==yearOfBirth) #identify 
  #the column corresponding to the cohort 
  #definex the probabilities from which 
  #the projection is to be taken
  maxLength<-min(nrow(mortalityTable)-1,
                 ncol(mortalityTable)-colIndex)
  qxOut<-numeric(maxLength+1)
  for(i in 0:maxLength)
    qxOut[i+1]<-mortalityTable[i+1,colIndex+i]
  #fix: we add a fictional omega age where 
  #death probability = 1
  qxOut<-c(qxOut,1)
  return(qxOut)
}

## ----leecarter4, tidy=FALSE, size='scriptsize'---------------------------
#generate the life tables
qx1920<-getCohortQx(yearOfBirth = 1920)
lt1920<-probs2lifetable(probs=qx1920,type="qx",
name="Table 1920")
at1920<-new("actuarialtable",x=lt1920@x,
lx=lt1920@lx,interest=0.015)
qx1950<-getCohortQx(yearOfBirth = 1950)
lt1950<-probs2lifetable(probs=qx1950,
type="qx",name="Table 1950")
at1950<-new("actuarialtable",x=lt1950@x,
lx=lt1950@lx,interest=0.015)
qx1980<-getCohortQx(yearOfBirth = 1980)
lt1980<-probs2lifetable(probs=qx1980,
type="qx",name="Table 1980")
at1980<-new("actuarialtable",x=lt1980@x,
lx=lt1980@lx,interest=0.015)

## ----leecarter5, tidy=FALSE, echo=TRUE-----------------------------------
cat("Results for 1920 cohort","\n")
c(exn(at1920,x=65),axn(at1920,x=65))
cat("Results for 1950 cohort","\n")
c(exn(at1950,x=65),axn(at1950,x=65))
cat("Results for 1980 cohort","\n")
c(exn(at1980,x=65),axn(at1980,x=65))

## ----actmat.1------------------------------------------------------------
data("demoIta")
sim92Act<-new("actuarialtable",x=demoIta$X, 
lx=demoIta$SIM92, name='SIM92')
sif92Act<-new("actuarialtable",x=demoIta$X,
lx=demoIta$SIF92, name='SIF92')
head(sim92Act)

## ----actmat.2, echo=TRUE-------------------------------------------------
100000*Exn(sim92Act,x=25,n=40)
100000*AExn(sim92Act,x=25,n=40)
1000*12*axn(sim92Act,x=65,k=12)
100000*Axn(sim92Act,x=25,n=40)

## ----actmat.3, echo=TRUE-------------------------------------------------
IAxn(sim92Act,x=40,n=10)+DAxn(sim92Act,x=40,n=10)
(10+1)*Axn(sim92Act,x=40,n=10)

## ----actmat.5, echo=TRUE-------------------------------------------------
fr_pay=12
1000*fr_pay*axyzn(tablesList = list(sim92Act,sif92Act),
x = c(64,67),status="last",k=fr_pay)
1000*fr_pay*(axn(sim92Act,x=64,k=fr_pay)+axn(sif92Act,
x=67,k=fr_pay)-axyzn(tablesList = list(sim92Act,sif92Act),
x = c(64,67),status="joint",k=fr_pay))

## ----act.sim, echo=TRUE--------------------------------------------------
hist(rLifeContingencies(n = 1000,lifecontingency = "Axn",
x = 40,object = sim92Act,getOmega(sim92Act)-40),
main="Life Insurance on 40 PV distribution")

