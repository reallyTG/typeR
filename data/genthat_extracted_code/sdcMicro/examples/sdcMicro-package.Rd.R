library(sdcMicro)


### Name: sdcMicro-package
### Title: Statistical Disclosure Control (SDC) for the generation of
###   protected microdata for researchers and for public use.
### Aliases: sdcMicro-package sdcMicro
### Keywords: package

### ** Examples


## example from Capobianchi, Polettini and Lucarelli:
data(francdat)
f <- freqCalc(francdat, keyVars=c(2,4,5,6),w=8)
f
f$fk
f$Fk
## with missings:
x <- francdat
x[3,5] <- NA
x[4,2] <- x[4,4] <- NA
x[5,6]  <- NA
x[6,2]  <- NA
f2 <- freqCalc(x,  keyVars=c(2,4,5,6),w=8)
f2$Fk
## individual risk calculation:
indivf <- indivRisk(f)
indivf$rk
## Local Suppression
localS <- localSupp(f, keyVar=2, threshold=0.25)
f2 <- freqCalc(localS$freqCalc, keyVars=c(2,4,5,6), w=8)
indivf2 <- indivRisk(f2)
indivf2$rk

## select another keyVar and run localSupp once again,
#if you think the table is not fully protected
data(free1)
free1 <- as.data.frame(free1)
f <- freqCalc(free1, keyVars=1:3, w=30)
ind <- indivRisk(f)
## and now you can use the interactive plot for individual risk objects:
## plot(ind)

## example from Capobianchi, Polettini and Lucarelli:
data(francdat)
l1 <- localSuppression(francdat, keyVars=c(2,4,5,6), importance=c(1,3,2,4))
l1
l1$x
l2 <- localSuppression(francdat, keyVars=c(2,4,5,6), k=2)
l3 <- localSuppression(francdat, keyVars=c(2,4,5,6), k=4)

## Data from mu-Argus:
## Global recoding:
data(free1)
free1 <- as.data.frame(free1)
free1[, "AGE"] <- globalRecode(free1[,"AGE"], c(1,9,19,29,39,49,59,69,100), labels=1:8)

## Top coding:
topBotCoding(free1[,"DEBTS"], value=9000, replacement=9100, kind="top")

## Numerical Rank Swapping:
## do not use the mu-Argus test data set (free1)
# since the numerical variables are (probably) faked.
data(Tarragona)
Tarragona1 <- rankSwap(Tarragona, P=10)

## Microaggregation:
m1 <- microaggregation(Tarragona, method="onedims", aggr=3)
m2 <- microaggregation(Tarragona, method="pca", aggr=3)
# summary(m1)
## approx. 1 minute computation time
# valTable(Tarragona, method=c("simple","onedims","pca"))


data(microData)
microData <- as.data.frame(microData)
m1 <- microaggregation(microData, method="mdav")
x <- m1$x  ### fix me
summary(m1)
plotMicro(m1, 1, which.plot=1)  # too less observations...
data(free1)
free1 <- as.data.frame(free1)
plotMicro(microaggregation(free1[,31:34], method="onedims"), 1, which.plot=1)


## disclosure risk (interval) and data utility:
m1 <- microaggregation(Tarragona, method="onedims", aggr=3)
dRisk(obj=Tarragona, xm=m1$mx)
dRisk(obj=Tarragona, xm=m2$mx)
dUtility(obj=Tarragona, xm=m1$mx)
dUtility(obj=Tarragona, xm=m2$mx)

## S4 class code for Adding Noise methods will be included
#in the next version of sdcMicro.

## Fast generation of synthetic data with aprox.
#the same covariance matrix as the original one.

data(mtcars)
cov(mtcars[,4:6])
cov(dataGen(mtcars[,4:6],n=200))
pairs(mtcars[,4:6])
pairs(dataGen(mtcars[,4:6],n=200))

## PRAM

set.seed(123)
x <- factor(sample(1:4, 250, replace=TRUE))
pr1 <- pram(x)
length(which(pr1$x_pram == x))
summary(pr1)
x2 <- factor(sample(1:4, 250, replace=TRUE))
length(which(pram(x2)$x_pram == x2))

data(free1)
marstat <- as.factor(free1[,"MARSTAT"])
marstatPramed <- pram(marstat)
summary(marstatPramed)
## Not run: 
##D # FOR OBJECTS OF CLASS sdcMicro
##D data(testdata)
##D sdc <- createSdcObj(testdata,
##D   keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
##D   numVars=c('expend','income','savings'), w='sampling_weight')
##D head(sdc@manipNumVars)
##D ### Display Risks
##D sdc@risk$global
##D sdc <- dRisk(sdc)
##D sdc@risk$numeric
##D ### use addNoise without Parameters
##D sdc <- addNoise(sdc,variables=c("expend","income"))
##D head(sdc@manipNumVars)
##D sdc@risk$numeric
##D ### undolast
##D sdc <- undolast(sdc)
##D head(sdc@manipNumVars)
##D sdc@risk$numeric
##D ### redo addNoise with Parameter
##D sdc <- addNoise(sdc, noise=0.2)
##D head(sdc@manipNumVars)
##D sdc@risk$numeric
##D ### dataGen
##D #sdc <- undolast(sdc)
##D #head(sdc@risk$individual)
##D #sdc@risk$global
##D #sdc <- dataGen(sdc)
##D #head(sdc@risk$individual)
##D #sdc@risk$global
##D ### LocalSuppression
##D sdc <- undolast(sdc)
##D head(sdc@risk$individual)
##D sdc@risk$global
##D sdc <- localSuppression(sdc)
##D head(sdc@risk$individual)
##D sdc@risk$global
##D ### microaggregation
##D sdc <- undolast(sdc)
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D sdc <- microaggregation(sdc)
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D ### pram
##D sdc <- undolast(sdc)
##D head(sdc@risk$individual)
##D sdc@risk$global
##D sdc <- pram(sdc,keyVar="water")
##D head(sdc@risk$individual)
##D sdc@risk$global
##D ### rankSwap
##D sdc <- undolast(sdc)
##D head(sdc@risk$individual)
##D sdc@risk$global
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D sdc <- rankSwap(sdc)
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D head(sdc@risk$individual)
##D sdc@risk$global
##D ### suda2
##D sdc <- suda2(sdc)
##D sdc@risk$suda2
##D ### topBotCoding
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D sdc@risk$numeric
##D sdc <- topBotCoding(sdc, value=60000000, replacement=62000000, column="income")
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D sdc@risk$numeric
##D ### LocalRecProg
##D data(testdata2)
##D sdc <- createSdcObj(testdata2,
##D   keyVars=c("urbrur", "roof", "walls", "water", "sex", "relat"))
##D sdc@risk$global
##D sdc <- LocalRecProg(sdc)
##D sdc@risk$global
##D ### LLmodGlobalRisk
##D sdc <- undolast(sdc)
##D sdc <- LLmodGlobalRisk(sdc, inclProb=0.001)
##D sdc@risk$model
## End(Not run)




