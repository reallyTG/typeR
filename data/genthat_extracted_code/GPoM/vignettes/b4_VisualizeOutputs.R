## ---- eval = TRUE--------------------------------------------------------
data("Ross76")
# time vector
tin <- Ross76[seq(1, 3000, by = 8), 1]
# single time series
data <- Ross76[seq(1, 3000, by = 8), 3]
# global modelling
# results are put in list outputGPoM
outputGPoM <- gPoMo(data, tin=tin, dMax = 2, nS=c(3), show = 0, method = 'rk4',
                    nPmax = 12, IstepMin = 400, IstepMax = 401)

## ---- eval = TRUE, fig.align='center'------------------------------------
# plot data and models time series
plot(outputGPoM$tin, outputGPoM$inputdata,
     xlab='t', ylab='y(t)', main = 'Time series', cex=0.4)
lines(outputGPoM$tfiltdata, outputGPoM$filtdata[,1], type='l', col='green')
legend(0,-5, c("original", "filtered"), col=c('black', 'green'), 
       lty=c(1,NA), pch=c(NA,1), cex = 0.8)


## ---- eval = TRUE, fig.show='hold', fig.width=3.5, fig.height=3.5--------
# plot data and models time series
plot(outputGPoM$filtdata[,1], outputGPoM$filtdata[,2], xlab='y', 
     ylab= expression(dy/dt), main = 'First projection', type = 'l', cex = 0.4)
plot(outputGPoM$filtdata[,1], outputGPoM$filtdata[,3], xlab='y', 
     ylab= expression(d^2*y/dt^2), main = 'Second projection', type = 'l', cex = 0.4)

## ---- eval = TRUE--------------------------------------------------------
# How many models could not be identified as non-diverging
sum(outputGPoM$okMod)

## ---- eval = TRUE--------------------------------------------------------
# what is the reference number of these models?
which(outputGPoM$okMod == 1)

## ---- eval = TRUE, fig.show='hold'---------------------------------------
# plot data and models time series
plot(outputGPoM$tin, outputGPoM$inputdata,
     xlab='t', ylab='y(t)', cex = 0.4, main = 'Model 7')
lines(outputGPoM$tfiltdata, outputGPoM$filtdata[,1], type='l', col='green')
lines(outputGPoM$tout, outputGPoM$stockoutreg$model7[,1], type='l', col='red')
legend(0,-4.5, c("original", "filtered", "model"), col=c('black', 'green', 'red'), 
       lty=c(NA,1,1), pch=c(1, NA, NA), cex = 0.6)
#
plot(outputGPoM$tin, outputGPoM$inputdata,
     xlab='t', ylab='y(t)', cex = 0.4, main = 'Model 9')
lines(outputGPoM$tfiltdata, outputGPoM$filtdata[,1], type='l', col='green')
lines(outputGPoM$tout, outputGPoM$stockoutreg$model9[,1], type='l', col='red')
legend(0,-4.5, c("original", "filtered", "model"), col=c('black', 'green', 'red'), 
       lty=c(NA,1,1), pch=c(1, NA, NA), cex = 0.6)

## ---- eval = TRUE--------------------------------------------------------
head(outputGPoM$filtdata[1:3], 1)
head(outputGPoM$stockoutreg$model7, 1)

## ---- eval = TRUE, fig.show='hold', fig.width=4, fig.height=4------------
# plot data and models phase portraits
plot(outputGPoM$filtdata[,1], outputGPoM$filtdata[,2], type='l', col='green',
     xlab='y', ylab='dy/dt', main = 'Model 7')
lines(outputGPoM$stockoutreg$model7[,1], outputGPoM$stockoutreg$model7[,2],
      type='l', col='red')
legend(0,3.9,c("model", "filtered"), col=c('red', 'green'), lty=c(1,1), cex=0.6)

#
plot(outputGPoM$filtdata[,1], outputGPoM$filtdata[,2], type='l', col='green',
     xlab='y', ylab='dy/dt', main = 'Model 9')
lines(outputGPoM$stockoutreg$model9[,1], outputGPoM$stockoutreg$model9[,2],
      type='l', col='red')
legend(0,3.9,c("model", "filtered"), col=c('red', 'green'), lty=c(1,1), cex=0.6)


## ---- eval = TRUE--------------------------------------------------------
nVar <- dim(outputGPoM$models$model7)[2]
pMax <- dim(outputGPoM$models$model7)[1]
dMax <- p2dMax(nVar,pMaxKnown = pMax)
# See equations
visuEq(nVar, dMax, outputGPoM$models$model7, approx = 2)
#
visuEq(nVar, dMax, outputGPoM$models$model9, approx = TRUE)

## ---- eval = TRUE--------------------------------------------------------
# for model #7
sum(outputGPoM$models$model7 != 0)
# for model #9
sum(outputGPoM$models$model9 != 0)

## ---- eval = TRUE--------------------------------------------------------
# for model #7
colSums(outputGPoM$models$model7 != 0)
# for model #9
colSums(outputGPoM$models$model9 != 0)

## ---- eval = FALSE-------------------------------------------------------
#  ######################
#  # automatic ##########
#  ######################
#  visuOutGP(outputGPoM)

