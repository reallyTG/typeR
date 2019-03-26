### R code from vignette source 'Guide.Stex'

###################################################
### code chunk number 1: Guide.Stex:56-58
###################################################
 options(continue="  ")
 options(width=65)


###################################################
### code chunk number 2: Guide.Stex:143-144
###################################################
library("dse")


###################################################
### code chunk number 3: Guide.Stex:155-156 (eval = FALSE)
###################################################
## data(package="dse")


###################################################
### code chunk number 4: Guide.Stex:160-162
###################################################
data(eg1.DSE.data, package="dse")  
data(egJofF.1dec93.data, package="dse")  


###################################################
### code chunk number 5: Guide.Stex:258-260
###################################################
fileName <- system.file("otherdata", "eg1.dat", package="dse")
eg1.DSE.data <- t(matrix(scan(fileName),5, 364))[, 2:5]


###################################################
### code chunk number 6: Guide.Stex:264-266
###################################################
eg1.DSE.data <- TSdata(input= eg1.DSE.data[,1,drop = F],
                      output= eg1.DSE.data[, 2:4, drop = F])


###################################################
### code chunk number 7: Guide.Stex:271-273
###################################################
eg1.DSE.data <-tframed(eg1.DSE.data, 
          list(start=c(1961,3), frequency=12)) 


###################################################
### code chunk number 8: Guide.Stex:289-291
###################################################
seriesNamesInput(eg1.DSE.data) <- "R90"
seriesNamesOutput(eg1.DSE.data) <- c("M1","GDPl2", "CPI") 


###################################################
### code chunk number 9: Guide.Stex:305-308
###################################################
model1 <- estVARXls(eg1.DSE.data)
model2 <- estSSMittnik(eg1.DSE.data, n=4) 
# or model2 <- estSSMittnik(eg1.DSE.data) prompts for state dimension


###################################################
### code chunk number 10: Guide.Stex:321-328
###################################################
summary(model1)
summary(model2)
model1
model2
stability(model1)
stability(model2)
informationTests(model1, model2)


###################################################
### code chunk number 11: Guide.Stex:334-335
###################################################
tfplot(model1)


###################################################
### code chunk number 12: Guide.Stex:347-351
###################################################
tfplot(model2)
tfplot(eg1.DSE.data)
checkResiduals(model1)
checkResiduals(model2) 


###################################################
### code chunk number 13: Guide.Stex:407-420
###################################################
AR <- array(c(1, .5, .3, 0, .2, .1, 0, .2, .05, 1, .5, .3),
            c(3,2,2)) 
MA <- array(c(1, .2, 0, .1, 0, 0, 1, .3), c(2,2,2)) 
arma <- ARMA(A=AR, B=MA, C=NULL) 
rm(AR, MA) # these can be removed from the environment as 
           #they are no longer needed 
arma 
stability(arma) 
data.arma.sim <- simulate(arma, start=c(1920,1), freq=1) 
arma <- l(arma, data.arma.sim) 
summary(arma) 
tfplot(data.arma.sim) 
tfplot(arma) 


###################################################
### code chunk number 14: Guide.Stex:442-453
###################################################
f <- array(c(.5, .3, .2, .4), c(2,2)) #Note: do not use capital
                                 #F (=FALSE) as a variable name
h <- array(c(1, 0, 0, 1), c(2,2))
k <- array(c(.5, .3, .2, .4), c(2,2))
ss <- SS(F=f, H=h, K=k) #F is argument name not variable name
print(ss)
stability(ss)
data.ss.sim <- simulate(ss, start=c(1920,1), freq=1)
ss <- l(ss, data.ss.sim)
summary(ss)
tfplot(ss) 


###################################################
### code chunk number 15: Guide.Stex:467-475
###################################################
ss.from.arma <- l(toSS(arma), data.arma.sim)
arma.from.ss <- l(toARMA(ss), data.ss.sim)
summary(ss.from.arma)
summary(arma)
summary(arma.from.ss)
summary(ss)
stability(arma)
stability(ss.from.arma) 


###################################################
### code chunk number 16: Guide.Stex:496-497
###################################################
tfplot(state(ss))


###################################################
### code chunk number 17: Guide.Stex:516-519
###################################################
ssc <- toSSChol(ss) 

ssc <- smoother(ssc)


###################################################
### code chunk number 18: Guide.Stex:522-525
###################################################
tfplot(state(ssc, filter=TRUE))

tfplot(state(ssc, smoother=TRUE))


###################################################
### code chunk number 19: Guide.Stex:530-531
###################################################
tfplot(state(ssc, smoother=TRUE), state(ssc, filter=TRUE))


###################################################
### code chunk number 20: Guide.Stex:557-558
###################################################
model.eg1.ls <- estVARXls(trimNA(eg1.DSE.data)) 


###################################################
### code chunk number 21: Guide.Stex:570-572
###################################################
subsample.data <- tfwindow(eg1.DSE.data, start=c(1972,1), 
   end=c(1992,12), warn=FALSE) 


###################################################
### code chunk number 22: Guide.Stex:586-590
###################################################
summary(model.eg1.ls)
print(model.eg1.ls)
tfplot(model.eg1.ls)
checkResiduals(model.eg1.ls) 


###################################################
### code chunk number 23: Guide.Stex:595-600
###################################################
model.eg1.ar <- estVARXar(trimNA(eg1.DSE.data))
model.eg1.ss <- estSSfromVARX(trimNA(eg1.DSE.data))
model.eg1.bft <- bft(trimNA(eg1.DSE.data))
model.eg1.mle <- estMaxLik(estVARXls(trimNA(eg1.DSE.data),
                           max.lag=1)) # see note below 


###################################################
### code chunk number 24: Guide.Stex:605-607
###################################################
tfplot(model.eg1.ls, model.eg1.ar)
tfplot(model.eg1.ls, model.eg1.ar, start=c(1990,1))


###################################################
### code chunk number 25: Guide.Stex:643-646
###################################################
eg4.DSE.data<- egJofF.1dec93.data
outputData(eg4.DSE.data) <- outputData(eg4.DSE.data, 
                                        series=c(1,2,6,7)) 


###################################################
### code chunk number 26: Guide.Stex:651-652
###################################################
model.eg4.bb <- estBlackBox(trimNA(eg4.DSE.data), max.lag=3) 


###################################################
### code chunk number 27: Guide.Stex:665-666
###################################################
informationTests(model.eg1.ar, model.eg1.ss) 


###################################################
### code chunk number 28: Guide.Stex:692-693
###################################################
eg4.DSE.model <- estVARXls(eg4.DSE.data) 


###################################################
### code chunk number 29: Guide.Stex:699-706
###################################################
new.data <- TSdata(
   input=ts(rbind(inputData(eg4.DSE.data), matrix(0.1,10,1)),
       start = start(eg4.DSE.data), 
       frequency = frequency(eg4.DSE.data)),
   output = ts(rbind(outputData(eg4.DSE.data), matrix(0.3,5,4)),
       start = start(eg4.DSE.data), 
       frequency = frequency(eg4.DSE.data))) 


###################################################
### code chunk number 30: Guide.Stex:714-715
###################################################
z <- l(TSmodel(eg4.DSE.model), trimNA(new.data)) 


###################################################
### code chunk number 31: Guide.Stex:731-732
###################################################
z <- forecast(TSmodel(eg4.DSE.model), new.data) 


###################################################
### code chunk number 32: Guide.Stex:737-739
###################################################
z <- forecast(TSmodel(eg4.DSE.model), trimNA(new.data),
              conditioning.inputs = inputData(new.data)) 


###################################################
### code chunk number 33: Guide.Stex:746-747
###################################################
tfplot(z, start=c(1990,6)) 


###################################################
### code chunk number 34: Guide.Stex:755-757
###################################################
z <- forecast(eg4.DSE.model, 
              conditioning.inputs.forecasts = matrix(0.5,6,1)) 


###################################################
### code chunk number 35: Guide.Stex:765-772
###################################################
summary(z)

print(z)

tfplot(z)

tfplot(z, start=c(1990,1)) 


###################################################
### code chunk number 36: Guide.Stex:777-778
###################################################
forecasts(z)[[1]]


###################################################
### code chunk number 37: Guide.Stex:784-785
###################################################
tfwindow(forecasts(z)[[1]], start=c(1994,1), warn=FALSE) 


###################################################
### code chunk number 38: Guide.Stex:804-805
###################################################
z <- l(TSmodel(eg4.DSE.model), new.data)


###################################################
### code chunk number 39: Guide.Stex:809-810
###################################################
tfplot(z)


###################################################
### code chunk number 40: Guide.Stex:827-829
###################################################
z <- featherForecasts(TSmodel(eg4.DSE.model), new.data)
tfplot(z)


###################################################
### code chunk number 41: Guide.Stex:835-837
###################################################
z <- featherForecasts(TSmodel(eg4.DSE.model), new.data, 
 from.periods = c(20, 50, 60, 70, 80), horizon=150)


###################################################
### code chunk number 42: Guide.Stex:841-842
###################################################
tfplot(z)


###################################################
### code chunk number 43: Guide.Stex:848-850
###################################################
z <- horizonForecasts(TSmodel(eg4.DSE.model), new.data, 
                      horizons = c(1,3,6))


###################################################
### code chunk number 44: Guide.Stex:854-855
###################################################
tfplot(z)


###################################################
### code chunk number 45: Guide.Stex:887-891
###################################################
fc <- forecastCov(TSmodel(eg4.DSE.model), data = eg4.DSE.data)
tfplot(fc)
tfplot(forecastCov(TSmodel(eg4.DSE.model), data = eg4.DSE.data, 
                   horizons = 1:4)) 


###################################################
### code chunk number 46: Guide.Stex:897-900
###################################################
fc <- forecastCov(TSmodel(eg4.DSE.model), data = eg4.DSE.data, 
                  zero = T, trend =T )
tfplot(fc)


