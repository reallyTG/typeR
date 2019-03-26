## ---- eval=TRUE----------------------------------------------------------
# parameters
a = 0.52
b = 2
c = 4
# equations
Eq1 <- c(0,-1, 0,-1, 0, 0, 0, 0, 0, 0)
Eq2 <- c(0, 0, 0, a, 0, 0, 1, 0, 0, 0)
Eq3 <- c(b,-c, 0, 0, 0, 0, 0, 1, 0, 0)
K = cbind(Eq1, Eq2, Eq3)
visuEq(3, 2, K, substit = c("x", "y", "z"))

## ---- eval=TRUE, fig.align='center'--------------------------------------
# equations
v1 <- c(0.6, -0.6, 0.4)
v2 <- c(-4, 2, 0.)
nVar = 3
dMax = 2
outNumi1 <- numicano(nVar, dMax, Istep = 2000, onestep = 1/50, KL = K, v0 = v1)
outNumi2 <- numicano(nVar, dMax, Istep = 2000, onestep = 1/50, KL = K, v0 = v2)
plot(outNumi2$reconstr[,1], outNumi2$reconstr[,2], type = 'l', xlab = 't', ylab = 'x(t)')
lines(outNumi1$reconstr[,1], outNumi1$reconstr[,2], type = 'l', col = 'red')
legend(3,-2.5, c("i.c. v1", "i.c. v2"), col=c('red', 'black'), lty=1, cex = 0.8)

## ---- eval=TRUE, fig.align='center', fig.width=5, fig.height=5-----------
plot(outNumi2$reconstr[,2], outNumi2$reconstr[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)')
lines(outNumi1$reconstr[,2], outNumi1$reconstr[,3], type = 'l', col = 'red')
lines(outNumi2$reconstr[1:400,2], outNumi2$reconstr[1:400,3], type = 'p', col = 'orange', cex = 0.6)
# initial condition
lines(outNumi2$reconstr[1,2], outNumi2$reconstr[1,3], type = 'p', lwd = 3)
lines(outNumi1$reconstr[1,2], outNumi1$reconstr[1,3], type = 'p', col = 'red', lwd = 3)
legend(4,2, c("i.c. v1", "i.c. v2", "transient v2"), col=c('red', 'black', 'orange'), 
       lty=c(1,1, NA), pch = c(NA,NA,1), cex = 0.6)

## ----gpomo1, eval=TRUE---------------------------------------------------
# time vector
tin <- outNumi1$reconstr[,1]
# modelling from time series starting from initial condition v1
out1 <- gPoMo(data = outNumi1$reconstr[,2:4], tin = tin, dMax = 2, nS = c(1,1,1), show = 0,
              IstepMin = 10, IstepMax = 1500, nPmin = 7, nPmax = 7, method = 'rk4')

## ----gpomo2, eval=FALSE, include=FALSE-----------------------------------
#  
#  # modelling from time series starting from initial condition v1
#  out2 <- gPoMo(data = outNumi2$reconstr[,2:4], tin = tin, dMax = 2, nS = c(1,1,1), show = 0,
#                IstepMin = 10, IstepMax = 1500, nPmin = 7, nPmax = 7, method = 'rk4')

## ---- eval=FALSE---------------------------------------------------------
#  # visualize all the models obtained from i.c. v1
#  visuOutGP(out1)
#  # visualize all the models obtained from i.c. v2
#  visuOutGP(out2)

## ----visu1, eval=FALSE---------------------------------------------------
#  # Edit the equations of model obtained from time series generated from v1
#  visuEq(nVar = 3, dMax = 2, out1$models$model5, substit = c("x", "y", "z"), approx = 2)

## ----visu1b, echo = FALSE, eval=TRUE-------------------------------------
# Edit the equations of model obtained from time series generated from v1
visuEq(nVar = 3, dMax = 2, data_vignetteVI$out1model5, substit = c("x", "y", "z"), approx = 2)

## ----visu2, eval=FALSE---------------------------------------------------
#  # Edit the equations of model obtained from time series generated from v2
#  visuEq(nVar = 3, dMax = 2, out2$models$model5, substit = c("x", "y", "z"), approx = 2)

## ----visu2b, eval=TRUE, echo=FALSE---------------------------------------
# Edit the equations of model obtained from time series generated from v2
visuEq(nVar = 3, dMax = 2, data_vignetteVI$out1model5, substit = c("x", "y", "z"), approx = 2)

## ---- eval=TRUE, include=FALSE-------------------------------------------
# modelling from time series starting from initial condition v1
out3 <- gPoMo(data = outNumi2$reconstr[1:400,2:4], tin = tin[1:400],
              dMax = 2, nS = c(1,1,1), show = 0,
              IstepMin = 10, IstepMax = 1500, nPmin = 7, nPmax = 7,
              method = 'rk4')

## ---- eval=FALSE---------------------------------------------------------
#  # min values
#  min(abs((out1$models$model5 - K) / K) * 100, na.rm = TRUE)
#  min(abs((out2$models$model5 - K) / K) * 100, na.rm = TRUE)
#  min(abs((out3$models$model5 - K) / K) * 100, na.rm = TRUE)
#  # max values
#  max(abs((out1$models$model5 - K) / K) * 100, na.rm = TRUE)
#  max(abs((out2$models$model5 - K) / K) * 100, na.rm = TRUE)
#  max(abs((out3$models$model5 - K) / K) * 100, na.rm = TRUE)

## ---- eval=TRUE, fig.align='center'--------------------------------------
plot(outNumi1$reconstr[,1], outNumi1$reconstr[,2], type = 'l', xlab = 't', ylab = 'x(t)', lwd = 3)
lines(outNumi1$reconstr[1:1000,1], outNumi1$reconstr[1:1000,2]+0.25, col = 2, lwd = 3)
lines(outNumi1$reconstr[1:900,1], outNumi1$reconstr[1:900,2]+0.5, col = 3, lwd = 3)
lines(outNumi1$reconstr[1:800,1], outNumi1$reconstr[1:800,2]+1., col = 4, lwd = 3)
lines(outNumi1$reconstr[1:700,1], outNumi1$reconstr[1:700,2]+1.25, col = 5, lwd = 3)

## ---- eval=TRUE, fig.align='center', fig.width=4, fig.height=4-----------
plot(outNumi1$reconstr[,2], outNumi1$reconstr[,3], type = 'l', 
     xlab = 'x(t)', ylab = 'y(t)', lwd = 3)
lines(outNumi1$reconstr[1:1000,2], outNumi1$reconstr[1:1000,3], col = 2, lwd = 3)
lines(outNumi1$reconstr[1:900,2], outNumi1$reconstr[1:900,3], col = 3, lwd = 3)
lines(outNumi1$reconstr[1:800,2], outNumi1$reconstr[1:800,3], col = 4, lwd = 3)
lines(outNumi1$reconstr[1:700,2], outNumi1$reconstr[1:700,3], col = 5, lwd = 3)

## ---- eval=FALSE, include=FALSE------------------------------------------
#  # modelling using half the initial time series
#  out4 <- gPoMo(data = outNumi1$reconstr[1:1000,2:4], tin = tin[1:1000],
#                dMax = 2, nS = c(1,1,1), show = 0,
#                IstepMin = 10, IstepMax = 400, nPmin = 7, nPmax = 7,
#                method = 'rk4')
#  # modelling using 45% of the initial time series
#  out5 <- gPoMo(data = outNumi1$reconstr[1:900,2:4], tin = tin[1:900],
#                dMax = 2, nS = c(1,1,1), show = 0,
#                IstepMin = 10, IstepMax = 400, nPmin = 7, nPmax = 7,
#                method = 'rk4')
#  # modelling using 40% of the initial time series
#  out6 <- gPoMo(data = outNumi1$reconstr[1:800,2:4], tin = tin[1:800],
#                dMax = 2, nS = c(1,1,1), show = 0,
#                IstepMin = 10, IstepMax = 400, nPmin = 7, nPmax = 7,
#                method = 'rk4')
#  # modelling using 35% of the initial time series
#  out7 <- gPoMo(data = outNumi1$reconstr[1:700,2:4], tin = tin[1:700],
#                dMax = 2, nS = c(1,1,1), show = 0,
#                IstepMin = 10, IstepMax = 400, nPmin = 7, nPmax = 7,
#                method = 'rk4')

## ---- eval=FALSE---------------------------------------------------------
#  # visualize all the models obtained from i.c. v1
#  visuOutGP(out7)

## ---- eval=FALSE---------------------------------------------------------
#  # min values
#  min(abs((out1$models$model5 - K) / K) * 100, na.rm = TRUE)
#  min(abs((out4$models$model5 - K) / K) * 100, na.rm = TRUE)
#  min(abs((out5$models$model5 - K) / K) * 100, na.rm = TRUE)
#  min(abs((out6$models$model5 - K) / K) * 100, na.rm = TRUE)
#  min(abs((out7$models$model5 - K) / K) * 100, na.rm = TRUE)
#  # max values
#  max(abs((out1$models$model5 - K) / K) * 100, na.rm = TRUE)
#  max(abs((out4$models$model5 - K) / K) * 100, na.rm = TRUE)
#  max(abs((out5$models$model5 - K) / K) * 100, na.rm = TRUE)
#  max(abs((out6$models$model5 - K) / K) * 100, na.rm = TRUE)
#  max(abs((out7$models$model5 - K) / K) * 100, na.rm = TRUE)

## ---- eval=TRUE, fig.align='center'--------------------------------------
plot(outNumi1$reconstr[,1], outNumi1$reconstr[,2],
     type = 'l', col = 'gray', xlab = 't', ylab = 'x(t)', lwd = 3)
# subsample
sub1 <- 50
tsub1 <- outNumi1$reconstr[seq(1, 2000, by = sub1),][,1]
datsub1 <- outNumi1$reconstr[seq(1, 2000, by = sub1),][,2:4]
lines(tsub1, datsub1[,1], type = 'p', col = 'red', lwd = 3)
# resample
xout <- seq(min(tsub1), max(tsub1), by = 0.01)
rspl1x <- spline(tsub1, y = datsub1[,1], method = "fmm", xout = xout)
rspl1y <- spline(tsub1, y = datsub1[,2], method = "fmm", xout = xout)
rspl1z <- spline(tsub1, y = datsub1[,3], method = "fmm", xout = xout)
lines(rspl1x$x, rspl1x$y, type='l', col='green')
legend(0, 5, c("original", "subsampled", "resampled"), col=c('gray', 'red', 'green'), 
       lty=c(1, NA, 1), pch = c(NA,1,NA), cex = 0.8)

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  # modelling using half the initial time series
#  out8 <- gPoMo(data = datsub1, tin = tsub1, dMax = 2, nS = c(1,1,1), show = 0,
#                IstepMin = 10, IstepMax = 400, nPmin = 2, nPmax = 12, method = 'rk4')

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  # modelling using half the initial time series
#  out9 <- gPoMo(data = cbind(rspl1x$y, rspl1y$y, rspl1z$y), tin = rspl1x$x,
#                dMax = 2, nS = c(1,1,1), show = 0, IstepMin = 10, IstepMax = 400,
#                nPmin = 2, nPmax = 12, method = 'rk4')

## ---- eval=FALSE---------------------------------------------------------
#  # model #44
#  visuOutGP(out9, selecmod = 44, prioMinMax = "model")

## ----visu9, eval=FALSE---------------------------------------------------
#  # Equations
#  visuEq(nVar = 3, dMax = 2, out9$models$model44, substit = 1, approx = 4)

## ----visu9b, eval=TRUE, echo=FALSE---------------------------------------
# Equations
visuEq(nVar = 3, dMax = 2, data_vignetteVI$out9model44 , substit = 1, approx = 4)

## ---- include=TRUE, eval=FALSE-------------------------------------------
#  # modelling using half the initial time series
#  out10 <- gPoMo(data = cbind(rspl1x$y, rspl1y$y, rspl1z$y), tin = rspl1x$x,
#                 dMax = 2, nS = c(1,1,1), show = 0, winL = 13,
#                 IstepMin = 10, IstepMax = 400, nPmin = 2, nPmax = 7,
#                 method = 'rk4')

## ---- eval=FALSE---------------------------------------------------------
#  # model #25
#  visuOutGP(out10, selecmod = 25, prioMinMax = "model")

## ---- eval=FALSE---------------------------------------------------------
#  # Equations
#  visuEq(nVar = 3, dMax = 2, out10$models$model25, substit = 1, approx = 4)

## ---- eval=TRUE, echo=FALSE----------------------------------------------
# Equations
visuEq(nVar = 3, dMax = 2, data_vignetteVI$out10model25, substit = 1, approx = 4)

## ---- eval=TRUE, fig.align='center'--------------------------------------
plot(outNumi1$reconstr[,1], outNumi1$reconstr[,2],
     type = 'l', col = 'gray', xlab = 't', ylab = 'x(t)', lwd = 3)
# variance of (x, y, z): (5.795879, 5.629243, 4.654374)
# add noise of 5% of the variance
An1 <- 0.05
t <- outNumi1$reconstr[,1]
datn1 <- outNumi1$reconstr[,2:4]
datn1[,1] <- datn1[,1] + rnorm(dim(datn1)[1], mean = 0, sd = sqrt(5.795879) * An1)
datn1[,2] <- datn1[,2] + rnorm(dim(datn1)[1], mean = 0, sd = sqrt(5.629243) * An1)
datn1[,3] <- datn1[,3] + rnorm(dim(datn1)[1], mean = 0, sd = sqrt(4.654374) * An1)
lines(t, datn1[,1],
      type = 'l', col = 'red', lwd = 1)

bf <- butter(2, 1/50, type="low")
b1x <- as.vector(filter(bf, datn1[,1]))
b1y <- as.vector(filter(bf, datn1[,2]))
b1z <- as.vector(filter(bf, datn1[,3]))
b1 <- cbind(b1x, b1y, b1z)
points(t[100:2000] - 0.5, b1[100:2000,1], col="black", pch=20)
legend(0, 5, c("original", "noisy (5%)"), col=c('gray', 'red'), lty=1, cex = 0.8)

## ---- eval=TRUE, fig.align='center'--------------------------------------
plot(outNumi1$reconstr[,1], outNumi1$reconstr[,2],
     type = 'l', col = 'gray', xlab = 't', ylab = 'x(t)', lwd = 3)
# add noise of 10% of the variance
An2 <- 0.2
t <- outNumi1$reconstr[,1]
datn2 <- outNumi1$reconstr[,2:4]
datn2[,1] <- datn2[,1] + rnorm(dim(datn2)[1], mean = 0, sd = sqrt(5.795879) * An2)
datn2[,2] <- datn2[,2] + rnorm(dim(datn2)[1], mean = 0, sd = sqrt(5.629243) * An2)
datn2[,3] <- datn2[,3] + rnorm(dim(datn2)[1], mean = 0, sd = sqrt(4.654374) * An2)
lines(t, datn2[,1],
      type = 'l', col = 'red', lwd = 1)
bf <- butter(2, 1/70, type="low")
b2x <- as.vector(filter(bf, datn2[,1]))
b2y <- as.vector(filter(bf, datn2[,2]))
b2z <- as.vector(filter(bf, datn2[,3]))
b2 <- cbind(b2x, b2y, b2z)
points(t[50:2000] - 0.5, b2[50:2000,1], col="black", pch=20)
legend(0, 5, c("original", "noisy (10%)"), col=c('gray', 'red'), lty=1, cex = 0.8)

## ---- include=FALSE, eval=FALSE------------------------------------------
#  # modelling using half the initial time series
#  out11 <- gPoMo(data = b1, tin = t,
#                 dMax = 2, nS = c(1,1,1), show = 0,
#                 IstepMin = 10, IstepMax = 400, nPmin = 2, nPmax = 12,
#                 method = 'rk4')

## ---- eval=FALSE---------------------------------------------------------
#  # model #25
#  visuOutGP(out11, selecmod = 25, prioMinMax = "model")

## ---- eval=FALSE---------------------------------------------------------
#  # Equations
#  visuEq(nVar = 3, dMax = 2, out11$models$model25, substit = 1, approx = 4)

## ---- echo=FALSE, eval=TRUE----------------------------------------------
# Equations
visuEq(nVar = 3, dMax = 2, data_vignetteVI$out11model25, substit = 1, approx = 4)

## ---- eval=FALSE---------------------------------------------------------
#  # min values
#  min(abs((out11$models$model25 - K) / K) * 100, na.rm = TRUE)
#  # max values
#  max(abs((out11$models$model25 - K) / K) * 100, na.rm = TRUE)

