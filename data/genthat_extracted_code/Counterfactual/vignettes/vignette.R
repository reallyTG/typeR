### R code from vignette source 'vignette.Rnw'

###################################################
### code chunk number 1: vignette.Rnw:72-73 (eval = FALSE)
###################################################
## install.packages("Counterfactual")


###################################################
### code chunk number 2: vignette.Rnw:77-78
###################################################
library(Counterfactual)


###################################################
### code chunk number 3: vignette.Rnw:81-82 (eval = FALSE)
###################################################
## help(package = "Counterfactual")


###################################################
### code chunk number 4: vignette.Rnw:85-86 (eval = FALSE)
###################################################
## help(counterfactual)


###################################################
### code chunk number 5: vignette.Rnw:89-90 (eval = FALSE)
###################################################
## ?counterfactual


###################################################
### code chunk number 6: vignette.Rnw:95-107 (eval = FALSE)
###################################################
## counterfactual(formula, data, weights, na.action = na.exclude, 
##                group, treatment = FALSE, decomposition = FALSE,
##                counterfactual_var, transformation = FALSE,
##                quantiles = c(1:9)/10, method = "qr",
##                trimming = 0.005, nreg = 100, scale_variable, 
##                counterfactual_scale_variable, 
##                censoring = 0, right = FALSE, nsteps = 3, 
##                firstc = 0.1, secondc = 0.05, noboot = FALSE, 
##                weightedboot = FALSE, seed = 8, robust = FALSE, 
##                reps = 100, alpha = 0.05, first = 0.1, 
##                last = 0.9, cons_test = 0, printdeco = TRUE, 
##                sepcore = FALSE, ncore=1)


###################################################
### code chunk number 7: fig1plot
###################################################
library(quantreg)
data(engel)
attach(engel)
counter_income <- mean(income)+0.75*(income-mean(income))
cdfx <- c(1:length(income))/length(income)
plot(c(0,4000),range(c(0,1)), xlim =c(0, 4000), type="n", xlab = "Income", 
     ylab="Probability")
lines(sort(income), cdfx)
lines(sort(counter_income), cdfx, lwd = 2, col = 'grey70')
legend(1500, .2, c("Original", "Counterfactual"), lwd=c(1,2),bty="n", 
       col=c(1,'grey70'))


###################################################
### code chunk number 8: fig1
###################################################
library(quantreg)
data(engel)
attach(engel)
counter_income <- mean(income)+0.75*(income-mean(income))
cdfx <- c(1:length(income))/length(income)
plot(c(0,4000),range(c(0,1)), xlim =c(0, 4000), type="n", xlab = "Income", 
     ylab="Probability")
lines(sort(income), cdfx)
lines(sort(counter_income), cdfx, lwd = 2, col = 'grey70')
legend(1500, .2, c("Original", "Counterfactual"), lwd=c(1,2),bty="n", 
       col=c(1,'grey70'))


###################################################
### code chunk number 9: vignette.Rnw:468-470
###################################################
qrres <- counterfactual(foodexp~income, counterfactual_var
        = counter_income, transformation = TRUE, sepcore = TRUE, ncore = 2)


###################################################
### code chunk number 10: vignette.Rnw:481-491
###################################################
taus  <- c(1:99)/100
first <- sum(as.double(taus <= .10))
last  <- sum(as.double(taus <= .90))
rang  <- c(first:last)
rqres <- counterfactual(foodexp~income, counterfactual_var=counter_income, 
                        nreg=100, quantiles=taus, transformation = TRUE, 
                        printdeco = FALSE, sepcore = TRUE,ncore=2)
duqf   <- (rqres$resCE)[,1]
l.duqf <- (rqres$resCE)[,5]
u.duqf <- (rqres$resCE)[,6]


###################################################
### code chunk number 11: fig2plot
###################################################
plot(c(0,1), range(c(min(l.duqf[rang]), max(u.duqf[rang]))), xlim = c(0,1), 
     type = "n", xlab = expression(tau), ylab = "Difference in Food Expenditure", 
     cex.lab=0.75)
polygon(c(taus[rang], rev(taus[rang])), c(u.duqf[rang], rev(l.duqf[rang])), 
        density = -100, border = F, col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf[rang]) 
abline(h = 0, lty = 2) 
legend(0, -90, "QE", cex = 0.75, lwd = 4, bty = "n", col = "grey70")
legend(0, -90, "QE", cex = 0.75, lty = 1, bty = "n", lwd = 1)


###################################################
### code chunk number 12: fig2
###################################################
plot(c(0,1), range(c(min(l.duqf[rang]), max(u.duqf[rang]))), xlim = c(0,1), 
     type = "n", xlab = expression(tau), ylab = "Difference in Food Expenditure", 
     cex.lab=0.75)
polygon(c(taus[rang], rev(taus[rang])), c(u.duqf[rang], rev(l.duqf[rang])), 
        density = -100, border = F, col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf[rang]) 
abline(h = 0, lty = 2) 
legend(0, -90, "QE", cex = 0.75, lwd = 4, bty = "n", col = "grey70")
legend(0, -90, "QE", cex = 0.75, lty = 1, bty = "n", lwd = 1)


###################################################
### code chunk number 13: vignette.Rnw:539-546
###################################################
data(nlsw88)
attach(nlsw88)
lwage    <- log(wage)
logitres <- counterfactual(lwage~tenure+ttl_exp+grade, 
                          group = union, treatment=TRUE,  
                          decomposition=TRUE, method = "logit", 
                          weightedboot = TRUE, sepcore = TRUE, ncore=2)


###################################################
### code chunk number 14: vignette.Rnw:557-583
###################################################
taus  <- c(1:99)/100
first <- sum(as.double(taus <= .10))
last  <- sum(as.double(taus <= .90))
rang  <- c(first:last) 
logitres <- counterfactual(lwage~tenure+ttl_exp+grade, 
          group = union, treatment=TRUE, quantiles=taus, 
          method="logit", nreg=100, weightedboot = TRUE, 
          printdeco=FALSE, decomposition = TRUE, 
          sepcore = TRUE,ncore=2)

duqf_SE   <- (logitres$resSE)[,1]
l.duqf_SE <- (logitres$resSE)[,5]
u.duqf_SE <- (logitres$resSE)[,6]

duqf_CE   <- (logitres$resCE)[,1]
l.duqf_CE <- (logitres$resCE)[,5]
u.duqf_CE <- (logitres$resCE)[,6]

duqf_TE   <- (logitres$resTE)[,1]
l.duqf_TE <- (logitres$resTE)[,5]
u.duqf_TE <- (logitres$resTE)[,6]

range_x <- min(c(min(l.duqf_SE[rang]), min(l.duqf_CE[rang]), 
                min(l.duqf_TE[rang])))
range_y <- max(c(max(u.duqf_SE[rang]), max(u.duqf_CE[rang]),
                max(u.duqf_TE[rang])))


###################################################
### code chunk number 15: fig3plot
###################################################
par(mfrow=c(1,3))

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "Difference in Wages", cex.lab=0.75,  
     main = "Total")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_TE[rang], rev(l.duqf_TE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_TE[rang]) 
abline(h = 0, lty = 2)

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "", cex.lab=0.75, main = "Structure")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_SE[rang], rev(l.duqf_SE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_SE[rang]) 
abline(h = 0, lty = 2)

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "", cex.lab=0.75, main = "Composition")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_CE[rang], rev(l.duqf_CE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_CE[rang]) 
abline(h = 0, lty = 2)


###################################################
### code chunk number 16: fig3
###################################################
par(mfrow=c(1,3))

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "Difference in Wages", cex.lab=0.75,  
     main = "Total")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_TE[rang], rev(l.duqf_TE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_TE[rang]) 
abline(h = 0, lty = 2)

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "", cex.lab=0.75, main = "Structure")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_SE[rang], rev(l.duqf_SE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_SE[rang]) 
abline(h = 0, lty = 2)

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "", cex.lab=0.75, main = "Composition")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_CE[rang], rev(l.duqf_CE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_CE[rang]) 
abline(h = 0, lty = 2)


###################################################
### code chunk number 17: vignette.Rnw:631-652
###################################################
coxres <- counterfactual(lwage~tenure+ttl_exp+grade, 
          group = union, treatment=TRUE, quantiles=taus,  
          method="cox", nreg=100, weightedboot = TRUE,  
          printdeco = FALSE, decomposition = TRUE, sepcore = TRUE,ncore=2)

duqf_SE   <- (coxres$resSE)[,1]
l.duqf_SE <- (coxres$resSE)[,5]
u.duqf_SE <- (coxres$resSE)[,6]

duqf_CE   <- (coxres$resCE)[,1]
l.duqf_CE <- (coxres$resCE)[,5]
u.duqf_CE <- (coxres$resCE)[,6]

duqf_TE   <- (coxres$resTE)[,1]
l.duqf_TE <- (coxres$resTE)[,5]
u.duqf_TE <- (coxres$resTE)[,6]

range_x = min(c(min(l.duqf_SE[rang]), min(l.duqf_CE[rang]), 
                min(l.duqf_TE[rang])))
range_y = max(c(max(u.duqf_SE[rang]), max(u.duqf_CE[rang]), 
                max(u.duqf_TE[rang])))


###################################################
### code chunk number 18: fig4plot
###################################################
par(mfrow=c(1,3))
plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "Difference in Wages", cex.lab=0.75, 
     main = "Total")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_TE[rang], rev(l.duqf_TE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_TE[rang]) 
abline(h = 0, lty = 2)

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = " ", cex.lab=0.75, main = "Structure")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_SE[rang], rev(l.duqf_SE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_SE[rang]) 
abline(h = 0, lty = 2)

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "", cex.lab=0.75, main = "Composition")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_CE[rang], rev(l.duqf_CE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_CE[rang]) 
abline(h = 0, lty = 2)


###################################################
### code chunk number 19: fig4
###################################################
par(mfrow=c(1,3))
plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "Difference in Wages", cex.lab=0.75, 
     main = "Total")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_TE[rang], rev(l.duqf_TE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_TE[rang]) 
abline(h = 0, lty = 2)

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = " ", cex.lab=0.75, main = "Structure")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_SE[rang], rev(l.duqf_SE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_SE[rang]) 
abline(h = 0, lty = 2)

plot(c(0,1), range(c(range_x, range_y)), xlim = c(0,1), type = "n", 
     xlab = expression(tau), ylab = "", cex.lab=0.75, main = "Composition")
polygon(c(taus[rang],rev(taus[rang])), 
        c(u.duqf_CE[rang], rev(l.duqf_CE[rang])), density = -100, border = F, 
        col = "grey70", lty = 1, lwd = 1)
lines(taus[rang], duqf_CE[rang]) 
abline(h = 0, lty = 2)


