## ---- eval = TRUE--------------------------------------------------------
# load data
data("Ross76")

## ---- eval = TRUE, fig.align='center'------------------------------------
# time vector
tin <- Ross76[,1]
# single time series
data <- Ross76[,3]
# plot
plot(tin, data, type='l', xlab = 't', ylab = 'y(t)', main = 'Original time series')

## ---- echo = TRUE--------------------------------------------------------
# model dimension
nVar = 3
# maximum polynomial degree
dMax = 2

## ---- eval = FALSE, echo = TRUE------------------------------------------
#  # generalized Polynomial modelling
#  out1 <- gPoMo(data, tin = tin, dMax = dMax, nS = nVar, show = 0,
#                nPmin = 9, nPmax = 11, verbose = FALSE, IstepMax = 3000)

## ---- eval = FALSE-------------------------------------------------------
#  which(out1$okMod == 1)

## ---- eval = TRUE, echo = FALSE------------------------------------------
which(data_vignetteIII$out1okMod == 1)

## ---- eval = FALSE, fig.align='center', fig.width=4, fig.height=4--------
#  # obtained model #3
#  plot(out1$stockoutreg$model3[,1], out1$stockoutreg$model3[,2], type='l', col = 'red',
#       xlab = 'y(t)', ylab = 'dy(t)/dt', main = 'Phase portrait')
#  # original phase portrait
#  lines(out1$filtdata[,1], out1$filtdata[,2])
#  legend(3,2,c("model", "original"), col=c('red', 'black'), lty=c(1,1), cex=0.6)
#  

## ---- eval = TRUE, echo = FALSE, fig.align='center', fig.width=4, fig.height=4----
# obtained model #3
library(float)
plot(dbl(data_vignetteIII$out1_stockoutreg_m3[,1]), dbl(data_vignetteIII$out1_stockoutreg_m3[,2]),
     type='l', col = 'red',
     xlab = 'y(t)', ylab = 'dy(t)/dt', main = 'Phase portrait')
# original phase portrait
lines(dbl(data_vignetteIII$out1_filtdata[,1]), dbl(data_vignetteIII$out1_filtdata[,2]))
legend(3,2,c("model", "original"), col=c('red', 'black'), lty=c(1,1), cex=0.6)


## ---- eval = FALSE-------------------------------------------------------
#  # obtained model #3
#  visuEq(nVar, dMax, out1$models$model3, approx = 1)

## ---- eval = TRUE, echo = FALSE------------------------------------------
# obtained model #3
visuEq(nVar, dMax, data_vignetteIII$out1_m3, approx = 1)

## ---- eval = TRUE--------------------------------------------------------
# multiple (three) time series
data <- Ross76[,2:4]

## ---- eval = TRUE, fig.align='center'------------------------------------
# x(t)
plot(tin, data[,1], ylim = c(-6.5,12), type='l', col = 'blue',
     xlab = 't', ylab = '', main = 'Original time series')
# y(t)
lines(tin, data[,2], type = 'l', col = 'orange')
# z(t)
lines(tin, data[,3], type = 'l', col = 'brown')
legend(35,12,c("x(t)", "y(t)", "z(t)"), col=c('blue', 'orange', 'brown'), lty=1, cex=0.8)


## ---- eval = FALSE-------------------------------------------------------
#  # generalized Polynomial modelling
#  out2 <- gPoMo(data, tin = tin, dMax = 2, nS = c(1,1,1),  show = 0,
#                IstepMin = 10, IstepMax = 3000, nPmin = 7, nPmax = 8)

## ---- eval = FALSE, fig.align='center', fig.width=4, fig.height=4--------
#  # obtained model #5
#  plot(out2$stockoutreg$model5[,1], out2$stockoutreg$model5[,2],
#       type='l', col = 'red',
#       xlab = 'x(t)', ylab = 'y(t)', main = 'Phase portrait')
#  # original phase portrait
#  lines(out2$filtdata[,1], out2$filtdata[,2])
#  legend(3,2,c("original", "model"), col=c('black', 'red'), lty=1, cex=0.5)
#  

## ---- eval = TRUE, echo = FALSE, fig.align='center', fig.width=4, fig.height=4----
# obtained model #5
plot(dbl(data_vignetteIII$out2_stockoutreg_m5[,1]), dbl(data_vignetteIII$out2_stockoutreg_m5[,2]),
     type='l', col = 'red',
     xlab = 'x(t)', ylab = 'y(t)', main = 'Phase portrait')
# original phase portrait
lines(dbl(data_vignetteIII$out2_filtdata[,1]), dbl(data_vignetteIII$out2_filtdata[,2]))
legend(3,2,c("original", "model"), col=c('black', 'red'), lty=1, cex=0.5)


## ---- eval = FALSE-------------------------------------------------------
#  visuEq(3, 2, out2$models$model5, approx = 4)

## ---- eval = TRUE, echo = FALSE------------------------------------------
visuEq(3, 2, data_vignetteIII$out2_m5, approx = 4)

## ---- eval = TRUE--------------------------------------------------------
# time vector
tin <- Ross76[,1]
# multiple (two) time series
data <- Ross76[,2:3]

## ---- eval = TRUE, fig.align='center'------------------------------------
# x(t)
plot(tin, data[,1], ylim = c(-6.5,6.5),
     type='l', col = 'blue',
     xlab = 't', ylab = '', main = 'Original time series')
# y(t)
lines(tin, data[,2], type = 'l', col = 'brown')
legend(30,6,c("x(t)", "y(t)"), col=c('blue', 'brown'), lty=1, cex=0.8)


## ---- eval = TRUE, fig.align='center'------------------------------------
# correlation between Rössler-x and Rössler-y
cor(data[,1], data[,2])

## ---- eval = TRUE, fig.align='center', fig.width=4, fig.height=4---------
plot(data[,1], data[,2],
     type='p', cex = 0.2, col = 'blue',
     xlab = 'x', ylab = 'y', main = 'Scatter plot (x,y)')

## ---- eval = TRUE--------------------------------------------------------
# model template:
EqS <- matrix(1, ncol = 3, nrow = 10)
EqS[,1] <- c(0,0,0,1,0,0,0,0,0,0)
EqS[,2] <- c(1,1,0,1,0,1,1,1,1,1)
EqS[,3] <- c(0,1,0,0,0,0,1,1,0,0)
visuEq(3, 2, EqS, substit = c('X1','X2','Y1'))

## ---- eval = FALSE-------------------------------------------------------
#  # generalized Polynomial modelling
#  out3 <- gPoMo(data, tin = tin, dMax = 2, nS=c(2,1), EqS = EqS,
#                show = 0, verbose = FALSE,
#                IstepMin = 10, IstepMax = 2000, nPmin = 9, nPmax = 11)

## ---- eval = FALSE, fig.align='center', fig.width=4, fig.height=4--------
#  # obtained model #2
#  plot(out3$stockoutreg$model2[,1], out3$stockoutreg$model2[,2],
#       type='l', col = 'red',
#       xlab = 'X1', ylab = 'X2', main = 'Phase portrait')
#  # original phase portrait
#  lines(out3$filtdata[,1], out3$filtdata[,2])
#  legend(-3,-5,c("original", "model"), col=c('black', 'red'), lty=1, cex=0.5)
#  

## ---- echo = FALSE, eval = TRUE, fig.align='center', fig.width=4, fig.height=4----
# obtained model #2
plot(dbl(data_vignetteIII$out3_stockoutreg_m2[,1]), dbl(data_vignetteIII$out3_stockoutreg_m2[,2]),
     type='l', col = 'red',
     xlab = 'y(t)', ylab = 'dy(t)/dt', main = 'Phase portrait')
# original phase portrait
lines(dbl(data_vignetteIII$out3_filtdata[,1]), dbl(data_vignetteIII$out3_filtdata[,2]))
legend(-3,-5,c("original", "model"), col=c('black', 'red'), lty=1, cex=0.5)


## ---- eval = FALSE-------------------------------------------------------
#  visuEq(3, 2, out3$models$model2, approx = 4, substit = c('X1','X2','Y1'))

## ---- eval = TRUE, echo = FALSE------------------------------------------
visuEq(3, 2, data_vignetteIII$out3_m2, approx = 4, substit = c('X1','X2','Y1'))

## ---- eval = TRUE--------------------------------------------------------
# load data
data("TSallMod_nVar3_dMax2")
# multiple (six) time series
tin <- TSallMod_nVar3_dMax2$SprK$reconstr[1:400,1]
TSRo76 <- TSallMod_nVar3_dMax2$R76$reconstr[,2:4]
TSSprK <- TSallMod_nVar3_dMax2$SprK$reconstr[,2:4]
data <- cbind(TSRo76,TSSprK)[1:400,]

## ---- eval = TRUE, fig.align='center'------------------------------------
# For the Rössler-1976 system
# x(t)
plot(tin, data[,1], ylim = c(-6.5,8.5), type='l', col = 'red',
     xlab = 't', ylab = '', main = 'Original time series')
# y(t)
lines(tin, data[,2], type = 'l', col = 'brown')
# z(t)
lines(tin, data[,3], type = 'l', col = 'orange')
# For the Sprott-K system
# u(t)
lines(tin, data[,4], type = 'l', col = 'green')
# v(t)
lines(tin, data[,5], type = 'l', col = 'darkgreen')
# w(t)
lines(tin, data[,6], type = 'l', col = 'lightgreen')
legend(3, 8,title = 'Rössler', c("x(t)", "y(t)", "z(t)"),
       col=c('red', 'brown', 'orange'), lty=1, cex=0.8)
legend(17, 8,title='Sprott-K', c("u(t)", "v(t)", "w(t)"),
       col=c('green', 'darkgreen', 'lightgreen'), lty=1, cex=0.8)


## ---- eval = FALSE-------------------------------------------------------
#  # generalized Polynomial modelling
#  out4 <- gPoMo(data, dtFixe = 1/20, dMax = 2, nS = c(1,1,1,1,1,1),
#                show = 0, method = 'rk4',
#                IstepMin = 2, IstepMax = 3,
#                nPmin = 13, nPmax = 13)

## ---- eval = FALSE, fig.show='hold', fig.width=4, fig.height=4-----------
#  KL <- out4$models$model347
#  v0 <- as.numeric(head(data,1))
#  outNumi <- numicano(nVar = 6, dMax = 2, Istep=5000, onestep=1/20, KL=KL, v0=v0)
#  # obtained model #347
#  plot(outNumi$reconstr[,2], outNumi$reconstr[,3],
#       type='l', col = 'red',
#       xlab = 'x(t)', ylab = 'y(t)', main = 'Phase portrait')
#  # original phase portrait
#  lines(out4$filtdata[,1], out4$filtdata[,2])
#  legend(4,2,c("original", "model"), col=c('black', 'red'), lty=1, cex=0.5)
#  
#  # original phase portrait
#  plot(outNumi$reconstr[,5], outNumi$reconstr[,6],
#       type='l', col = 'green',
#       xlab = 'u(t)', ylab = 'v(t)', main = 'Phase portrait')
#  # original phase portrait
#  lines(out4$filtdata[,4], out4$filtdata[,5])
#  legend(-3,1,c("original", "model"), col=c('black', 'green'), lty=1, cex=0.5)
#  

## ---- eval = TRUE, echo = FALSE, fig.show='hold', fig.width=4, fig.height=4----
KL <- data_vignetteIII$out4_m347
v0 <- as.numeric(head(data,1))
outNumi <- numicano(nVar = 6, dMax = 2, Istep=5000, onestep=1/20, KL=KL, v0=v0)
# obtained model #347
plot(outNumi$reconstr[,2], outNumi$reconstr[,3],
     type='l', col = 'red',
     xlab = 'x(t)', ylab = 'y(t)', main = 'Phase portrait')
# original phase portrait
lines(dbl(data_vignetteIII$out4_filtdata[,1]), dbl(data_vignetteIII$out4_filtdata[,2]))
legend(4,2,c("original", "model"), col=c('black', 'red'), lty=1, cex=0.5)

# original phase portrait
plot(outNumi$reconstr[,5], outNumi$reconstr[,6],
     type='l', col = 'green',
     xlab = 'u(t)', ylab = 'v(t)', main = 'Phase portrait')
# original phase portrait
lines(dbl(data_vignetteIII$out4_filtdata[,4]), dbl(data_vignetteIII$out4_filtdata[,5]))
legend(-3,1,c("original", "model"), col=c('black', 'green'), lty=1, cex=0.5)


## ---- eval = FALSE-------------------------------------------------------
#  visuEq(6, 2, out4$models$model347, approx = 2,
#         substit = c("x", "y", "z", "u", "v", "w"))

## ---- eval = TRUE, echo = FALSE------------------------------------------
visuEq(6, 2, data_vignetteIII$out4_m347, approx = 2, 
       substit = c("x", "y", "z", "u", "v", "w"))

## ---- eval = TRUE, fig.align='center'------------------------------------
# load data
data("Ross76")
# time vector
tin <- Ross76[1:1500,1]
# single time series
series0 <- series <- Ross76[1:1500,3]
# plot
plot(tin, series0, type = 'l', col = 'gray', xlab = 'time', ylab = 'Observational data')

## ---- eval = TRUE, fig.align='center'------------------------------------
# some noise is added
series[1:100] <- series[1:100] + 0.1 * runif(1:100, min = -1, max = 1)
series[301:320] <- series[301:320] + 0.5 * runif(1:20, min = -1, max = 1)
plot(tin, series, ylab='', type = 'l', col = 'black')
#
# weighting function
W <- tin * 0 + 1
W[1:100] <- 0  # the first fourty values will be discarded
W[301:320] <- 0  # twenty other values will be discarded too
lines(tin, W, type = 'l', col = 'brown')
legend(0, -2,c("observed data", "weighting function"),
       col=c('black', 'brown'), lty=1, cex=0.8)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # Weighted time series
#  GPout1 <- gPoMo(data = series, tin = tin, weight = W,
#                  dMax = 2, nS = 3, winL = 9, show = 1,
#                  IstepMin = 10, IstepMax = 6000,
#                  nPmin = 5, nPmax = 11, method = 'rk4')

## ---- echo = FALSE, eval = TRUE------------------------------------------
# Weighted time series
GPout1 <- gPoMo(data = series, tin = tin, weight = W,
                dMax = 2, nS = 3, winL = 9, show = 0,
                IstepMin = 10, IstepMax = 6000,
                nPmin = 5, nPmax = 11, method = 'rk4')

## ---- eval = TRUE--------------------------------------------------------
visuEq(3, 2, GPout1$models$model7, approx = 2)

## ---- eval = TRUE--------------------------------------------------------
# first weight which value not equal to zero:
i1 = which(GPout1$Wfiltdata== 1)[1]
v0 <-  GPout1$filtdata[i1,1:3]
rcstr <- numicano(nVar=3, dMax=2, Istep=5000, onestep=1/250,
                  KL = GPout1$models$model7,
                  v0=v0, method="rk4")

## ---- eval = TRUE, fig.align='center', fig.width=4, fig.height=4---------
plot(rcstr$reconstr[,2], rcstr$reconstr[,3], type='l', lwd = 3,
     main='phase portrait', xlab='y', ylab = 'dy/dt', col='orange')
# original data:
lines(GPout1$filtdata[,1], GPout1$filtdata[,2], type='l',
      main='phase portrait', col='black')
# initial condition
lines(v0[1], v0[2], type = 'p', col = 'red')
legend(-2,1,c("original", "model"), col=c('black', 'orange'), lty=1, cex=0.5)
legend(-2.1,-0.7,"initial conditions : ", cex = 0.5,  bty="n")

## ---- eval = TRUE--------------------------------------------------------
visuEq(3, 2, GPout1$models$model3, approx = 2)

## ---- eval = TRUE--------------------------------------------------------
# first weight which value not equal to zero:
i1 = which(GPout1$Wfiltdata== 1)[1]
v0 <-  GPout1$filtdata[i1,1:3]
KL3bis <- KL3 <- GPout1$models$model7
KL3bis[2,3] <- KL3[2,3] * 1.1
rcstr <- numicano(nVar = 3, dMax = 2,
                     Istep = 40000, onestep = 1/250, KL = KL3bis,
                     v0 = v0, method = "rk4")
plot(rcstr$reconstr[35000:40000,2], rcstr$reconstr[35000:40000,3],
     main='phase portrait', xlab='y', ylab = 'dy/dt',
     type='l', lwd = 3, col='orange')

## ---- eval = TRUE, fig.align='center'------------------------------------
# load data
data("severalTS")
# plot
plot(svrlTS$data1$TS[,1] - svrlTS$data1$TS[1,1], svrlTS$data1$TS[,2],
     type = 'l', col = 'gray',
     xlab = 'time', ylab = 'y(t)', main = 'Observational data',
     xlim = c(0, 20), ylim = c(-6, 2.2))
lines(svrlTS$data2$TS[,1] - svrlTS$data2$TS[1,1], svrlTS$data2$TS[,2],
      type = 'l', col = 'blue')
lines(svrlTS$data3$TS[,1] - svrlTS$data3$TS[1,1], svrlTS$data3$TS[,2],
      type = 'l', col = 'orange')
lines(svrlTS$data4$TS[,1] - svrlTS$data4$TS[1,1], svrlTS$data4$TS[,2],
      type = 'l', col = 'brown')

## ---- eval = TRUE, fig.align='center'------------------------------------
# Concatenate the data set into a single time series
winL = 55
concaTS <- concat(svrlTS, winL = winL)

## ---- eval = TRUE, fig.align='center'------------------------------------
# Plot the concatenated time series
plot(concaTS$sglTS$TS[,1], concaTS$sglTS$TS[,2],
     main = 'Concatenated time series',
     xlab = 'Time (concatenated)', ylab = 'y(t)',
     type = 'l', col = 'gray')
lines(concaTS$sglTS$TS[concaTS$sglTS$W == 1,1],
      concaTS$sglTS$TS[concaTS$sglTS$W == 1,2], type = 'p', col = 'green', cex = 0.5)
lines(concaTS$sglTS$TS[concaTS$sglTS$W == 0,1],
      concaTS$sglTS$TS[concaTS$sglTS$W == 0,2], type = 'p', col = 'red', cex = 0.5)
lines(concaTS$sglTS$TS[,1], concaTS$sglTS$W, type = 'l')

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  GPout2 <- gPoMo(data = concaTS$sglTS$TS[,2], tin = concaTS$sglTS$TS[,1],
#                  dMax = 2, nS = 3, winL = winL, weight = concaTS$sglTS$W, show = 1,
#                  IstepMin = 10, IstepMax = 12000, nPmin = 6, nPmax = 12, method = 'rk4')
#  

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  GPout2 <- gPoMo(data = concaTS$sglTS$TS[,2], tin = concaTS$sglTS$TS[,1],
#                  dMax = 2, nS = 3, winL = winL, weight = concaTS$sglTS$W, show = 0,
#                  IstepMin = 10, IstepMax = 12000, nPmin = 6, nPmax = 12, method = 'rk4')
#  

