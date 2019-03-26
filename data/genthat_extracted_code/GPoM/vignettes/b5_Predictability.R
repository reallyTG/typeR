## ---- eval = TRUE, include=FALSE-----------------------------------------
# load data
data("Ross76")
# time vector
tin <- Ross76[seq(1, 3000, by = 8), 1]
# single time series, here y(t) is chosen
data <- Ross76[seq(1, 3000, by = 8), 3]
# global modelling
# results are put in list outputGPoM
outputGPoM <- gPoMo(data[1:300], tin = tin[1:300], dMax = 2, nS=c(3),
                    show = 0, method = 'rk4',
                    nPmax = 12, IstepMin = 400, IstepMax = 401)

## ---- eval = TRUE--------------------------------------------------------
sum(outputGPoM$okMod)

## ---- eval = TRUE--------------------------------------------------------
which(outputGPoM$okMod == 1)

## ---- eval = TRUE--------------------------------------------------------
visuEq(3, 2, outputGPoM$models$model1)

## ---- eval = TRUE--------------------------------------------------------
x0 <- head(outputGPoM$filtdata, 1)[1:3]

## ---- eval = TRUE, fig.align='center'------------------------------------
###############
# forecasting #
###############
outNumi <- numicano(nVar = 3, dMax = 2, Istep = 100, onestep = 0.08, 
                    KL = outputGPoM$models$model7, v0 = x0, method = 'rk4')

plot(outputGPoM$tfilt, outputGPoM$filtdata[,1], xlim = c(0,10),
     type='l', main = 'Observed and simulated',
     xlab = expression(italic(h)), ylab = expression(italic(y(h))))

t0 = outputGPoM$tfilt[1]
lines(outNumi$reconstr[,1] + t0,outNumi$reconstr[,2], type='l', col = 'red')

nbpt <- length(outNumi$reconstr[,2])
lines(c(-5,30), c(0,0), type='l', col = 'gray')
lines(outNumi$reconstr[,1] + t0, outNumi$reconstr[,2] - outputGPoM$filtdata[1:nbpt,1],
      type='l', col = 'green')
legend(0,-4, c("simulated", "observed", "difference"), col=c('red', 'black', 'green'), 
       lty=1, cex = 0.6)

## ---- eval = TRUE--------------------------------------------------------
#######################
# test predictability #
#######################
outpred <- predictab(outputGPoM, hp = 15, Nech = 30, selecmod = 9, show = 0)

## ---- eval = TRUE, fig.show='hold'---------------------------------------
# manual visualisation of the outputs (e.g. for model 9):
plot(c(outpred$hpE[1], max(outpred$hpE)), c(0,0),
     type='l', main = 'Error growth',
     xlab = expression(h), ylab = expression(italic(e(h))),
     ylim = c(min(outpred$Errmod9), max(outpred$Errmod9)))

for (i in 1:dim(outpred$Errmod9)[2]) {
  lines(outpred$hpE, outpred$Errmod9[,i], col = 'green')
}
lines(c(outpred$hpE[1], max(outpred$hpE)), c(0,0), type='l')

# in terms of variance
# manual visualisation of the outputs (e.g. for model 9):
plot(c(outpred$hpE[1], max(outpred$hpE)), c(0,0),
     type='l', main = 'Square error growth',
     xlab = expression(italic(h)), ylab = expression(italic(e^2) (italic(h))),
     ylim = c(0, 0.25*max(outpred$Errmod9)^2))

for (i in 1:dim(outpred$Errmod9)[2]) {
  lines(outpred$hpE, outpred$Errmod9[,i]^2, col = 'green')
}
lines(c(outpred$hpE[1], max(outpred$hpE)), c(0,0), type='l')

## ---- eval = TRUE--------------------------------------------------------
#######################
# test predictability #
#######################
outpred <- predictab(outputGPoM, hp = 15, Nech = 30, selecmod = c(1,9), show = 0)

## ---- eval = TRUE, fig.show='hold'---------------------------------------
# manual visualisation of the outputs (e.g. for model 1):
image(outpred$tE, outpred$hpE, t(outpred$Errmod1),
      xlab = expression(italic(t)), ylab = expression(italic(h)),
      main = expression(italic(e[model1](t,h))))
# (e.g. for model 9):
image(outpred$tE, outpred$hpE, t(outpred$Errmod9),
      xlab = expression(italic(t)), ylab = expression(italic(h)),
      main = expression(italic(e[model9])(italic(t),italic(h))))

## ---- eval = FALSE-------------------------------------------------------
#  #######################
#  # test predictability #
#  #######################
#  outpred <- predictab(outputGPoM, hp = 15, Nech = 30)

