## ---- include=FALSE------------------------------------------------------
library(knitr)
opts_chunk$set(out.extra='style="display:block; margin: auto"', fig.align="center")

## ------------------------------------------------------------------------
#########################################################################################
## R code for
## Weighted Cox Regression using the R package coxphw
## written by Daniela Dunkler
#########################################################################################

## This R example code works with R >=3.4.2 and coxphw-package 4.0.1.

## load R packages
library("coxphw")
library("survival")
library("splines")                              # for splines::ns used in plotzph

pdfind <- FALSE                                 # indicator, if plots should be saved as pdf
runSimulation <- FALSE                          # indicator, if simulation should be run
                                                # Running the simulation is time-consuming.

#########################################################################################
## additional function for nice plots of scaled Schoenfeld residuals versus time
#########################################################################################

plotcoxzph <- function(x, resid = TRUE, se = TRUE, df = 4, nsmo = 40, var, wd = 1,
                       limits = NULL, ...)
{
  ## plot.cox.zph function from survival package 2.37-4 slightly adapted

  xx <- x$x
  yy <- x$y
  d <- nrow(yy)
  df <- max(df)
  nvar <- ncol(yy)
  pred.x <- seq(from = min(xx), to = max(xx), length = nsmo)
  temp <- c(pred.x, xx)
  lmat <- ns(temp, df = df, intercept = TRUE)
  pmat <- lmat[1:nsmo, ]
  xmat <- lmat[-(1:nsmo), ]
  qmat <- qr(xmat)
  if (qmat$rank < df)
    stop("Spline fit is singular, try a smaller degrees of freedom")

  if (se) {
    bk <- backsolve(qmat$qr[1:df, 1:df], diag(df))
    xtx <- bk %*% t(bk)
    seval <- d*((pmat%*% xtx) *pmat) %*% rep(1, df)
  }

  ylab <- paste("Beta(t) for", dimnames(yy)[[2]])
  if (missing(var)) var <- 1:nvar
  else {
    if (is.character(var)) var <- match(var, dimnames(yy)[[2]])
    if  (any(is.na(var)) || max(var)>nvar || min(var) <1)
      stop("Invalid variable requested")
  }

  if (x$transform == "log") {
    xx <- exp(xx)
    pred.x <- exp(pred.x)
  }
  else if (x$transform != "identity") {
    xtime <- as.numeric(dimnames(yy)[[1]])
    indx <- !duplicated(xx)
    apr1  <- approx(xx[indx], xtime[indx],
                    seq(min(xx), max(xx), length = 17)[2*(1:8)])
    temp <- signif(apr1$y, 2)
    apr2  <- approx(xtime[indx], xx[indx], temp)
    xaxisval <- apr2$y
    xaxislab <- rep("", 8)
    for (i in 1:8) xaxislab[i] <- format(temp[i])
  }

  for (i in var) {
    y <- yy[,i]
    yhat <- pmat %*% qr.coef(qmat, y)
    if (resid) yr <-range(yhat, y)
    else       yr <-range(yhat)
    if (se) {
      temp <- 2* sqrt(x$var[i,i] * seval)
      yup <- yhat + temp
      ylow<- yhat - temp
      yr <- range(yr, yup, ylow)
    }

    if (is.null(limits)) { limits <- yr }

    if (x$transform == "identity")
      plot(range(xx), limits, type = "n", xlab = "", ylab = "", lwd = 2, las = 1, ...)
    else if (x$transform == "log")
      plot(range(xx), limits, type = "n", xlab = "", ylab = "", log = "x", ...)
    else {
      plot(range(xx), limits, type ="n", xlab = "", ylab = "", lwd = 2, axes = FALSE, ...)
      axis(1, xaxisval, xaxislab)
      axis(2, las = 1)
      box()
    }
    if (resid) points(xx, y)
    lines(pred.x, yhat, lwd = wd, ...)
    if (se) {
      lines(pred.x, yup,lty = 2)
      lines(pred.x, ylow, lty = 2)
    }
  }
}

## ---- fig.width = 7, fig.height = 5--------------------------------------
## ------------------------------------------
data("gastric", package = "coxphw")
head(gastric)

## time in years
gastric$yrs <- gastric$time / 365.25

nrow(gastric)

## follow-up/observation time
survfit(Surv(yrs, abs(1 - status)) ~ 1, data = gastric)

## descriptive analysis
gtable0 <- table(gastric$status, deparse.level = 2)
gtable0
round(prop.table(gtable0) * 100, digits = 2)

gtable1 <- table(gastric$radiation, gastric$status, deparse.level = 2)
addmargins(gtable1)
round(prop.table(gtable1, margin = 1) * 100, digits = 2)

## check assumption of proportional hazards
gsurv <- survfit(Surv(yrs, status) ~ radiation, data = gastric)
summary(gsurv)

## plot of cumulative survival probabilities
if (pdfind) {  pdf(file = "figure1A.pdf", width = 10.2, height = 5)  }
  par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
  plot(gsurv, lty = 1:2, las = 1, lwd = 2)
  mtext(side = 1, line = 2.5, text = "time (years)", cex = 1.2)
  mtext(side = 2, line = 3, text = "survival distribution function", cex = 1.2)
  legend("topright", title = "radiation", legend = c("no", "yes"),
         lty = 1:2, inset = 0.05, bty = "n", cex = 1.4)
if (pdfind) {  dev.off() }


## plots of scaled Schoenfeld residuals and test departure from proportional hazards
gfit1 <- coxph(Surv(yrs, status) ~ radiation + cluster(id), data = gastric, x = TRUE,
               method = "breslow")
gfit1.ph <- cox.zph(fit = gfit1, transform = "km")
gfit1.ph

if (pdfind) {  pdf(file = "figure1B.pdf", width = 5, height = 5) }
  par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
  plotcoxzph(x = gfit1.ph, wd = 2, limits = c(-3, 4.3))
  abline(a = 0, b = 0, lty = 3)
  mtext(side = 1, line = 2.5, cex = 1.2,
        text = expression(paste("time (years, ", hat(F), "(t) transformation)")))
  mtext(side = 2, line = 2.2, cex = 1.2,
        text = expression(paste(hat(beta), "(t) for radiation")))
  ## add the linear fit
  abline(lm(gfit1.ph$y ~ gfit1.ph$x)$coefficients, lty = 3, col = "red", lwd = 2)
if (pdfind) {  dev.off() }

gfit1.ph2 <- cox.zph(fit = gfit1, transform = "identity")

if (pdfind) {  pdf(file = "figure1C.pdf", width = 5.2, height = 5) }
  par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 2))
  plotcoxzph(x = gfit1.ph2, wd = 2, limits = c(-3, 4.3))
  mtext(side = 1, line = 2.5, text = "time (years)", cex = 1.2)
  mtext(side = 2, line = 2.2, cex = 1.2,
        text = expression(paste(hat(beta), "(t) for radiation")))
  abline(a = 0, b = 0, lty = 3)
  mtext(text = "radiation...", side = 4, line = 0.1, font = 3)
  mtext(text = "protective",  side = 4, line = 1, adj = 0, font = 3)
  mtext(text = "    harmful",     side = 4, line = 1, adj = 1, font = 3)
if (pdfind) {  dev.off() }

## ignore non-proportional hazards and apply a standard Cox proportional hazards model
summary(coxph(Surv(yrs, status) ~ radiation + cluster(id), data = gastric, x = TRUE,
              method = "breslow"))

## or equivalently
## coxphw(Surv(yrs, status) ~ radiation, data = gastric, template = "PH")

## ---- fig.width = 7, fig.height = 5--------------------------------------
## ------------------------------------------
data("biofeedback", package = "coxphw")
head(biofeedback)

## descriptive analysis
nrow(biofeedback)

btable0 <- table(biofeedback$bfb, deparse.level = 2)
btable0
round(prop.table(btable0) * 100, digits = 2)

## follow-up/observation time
## survfit(Surv(thdur, abs(1-success)) ~ 1, data = biofeedback)
survfit(Surv(thdur, success) ~ 1, data = biofeedback)

btable1 <- table(biofeedback$bfb, biofeedback$success, deparse.level = 2)
addmargins(btable1)
round(prop.table(btable1, margin = 1) * 100, digits = 2)

## hist(biofeedback$theal)
## hist(biofeedback$log2heal)

## Kaplan-Meier analysis
bsurv <- survfit(Surv(thdur, success) ~ bfb, data = biofeedback)
summary(bsurv)

if (pdfind) {  pdf(file = "figure2A.pdf", width = 10, height = 5) }
  par(oma  =c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
  plot(bsurv, fun = "event", lty = 1:2, lwd = 2, las = 1, ylim = c(0, 1))
  mtext(side = 1, line = 2.5, text = "duration of therapy (days)", cex = 1.2)
  mtext(side = 2, line = 3, text = "cumulative propability of rehabilitation", cex = 1.2)
  legend("topleft", title = "biofeedback (bfb)", legend = c("no", "yes"), lty = 1:2,
         inset = 0.05, bty = "n", cex = 1.4)
if (pdfind) {  dev.off() }

bfit1 <- coxph(Surv(thdur, success) ~ bfb + log2heal + cluster(id), data = biofeedback,
               x = TRUE, method = "breslow")
summary(bfit1)
bfit1.ph <- cox.zph(bfit1, transform = "km")
bfit1.ph

if (pdfind) {  pdf(file = "figure2B.pdf", width = 5, height = 5) }
  par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
  plotcoxzph(x =  bfit1.ph[1], wd = 2)
  mtext(side = 1, line = 2.5, text = "duration of therapy (days)", cex = 1.2)
  mtext(side = 2, line = 2.2, text = expression(hat(beta)), cex = 1.2)
  abline(a = 0, b = 0, lty = 3)
  abline(lm(bfit1.ph$y[, 1] ~ bfit1.ph$x)$coefficients, lty = 3, col = "red", lwd = 2)
  legend("bottomleft", legend = "bfb", bty = "n", inset = 0.08, cex = 1.5)
if (pdfind) {  dev.off() }

if (pdfind) {  pdf(file = "figure2C.pdf", width = 5, height = 5) }
  par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
  plotcoxzph(x = bfit1.ph[2], wd = 2, limits = c(-4.5, 4))
  mtext(side = 1, line = 2.5, text = "duration of therapy (days)", cex = 1.2)
    mtext(side = 2, line = 2.2, text = expression(hat(beta)), cex = 1.2)
  abline(a = 0, b = 0, lty = 3)
  abline(lm(bfit1.ph$y[, 2] ~ bfit1.ph$x)$coefficients, lty = 3, col = "red", lwd = 2)
  legend("topright", legend = "log2heal", bty = "n", inset = 0.08, cex = 1.5)
if (pdfind) {  dev.off() }

## ---- fig.width = 7, fig.height = 5--------------------------------------
simulation <- function(n1 = 100, n2 = 100, sim = 10, seed = 123,
                       type = c("ph", "nph1", "nph2", "nph3"), scalewei = NULL,
                       shapewei = NULL, beta = NULL, scaleexp = NULL, shapewei2 = NULL,
                       scalewei2 = NULL, shapegom = NULL, scalegom = NULL, scaleexpC,
                       admincens, npop = 10000, xmaxplot = NULL, addconstant = 1e-4)
  {
    ## Simulate time-to-event data (following either an expoential, Weibuill or Gompertz
    ## distribution) with one binary explanatory variable, generate six versions of
    ## each simulated data set with differnt censoring patterns (no censoring, administrative
    ## censoring and loss-to-follow-up) and analyse these data sets with Cox regression
    ## and weighted Cox regression. Population-c is computed, as well.
    ##
    ## sim: number of simulations, 0 only population c is computed and plot is generated.
    ##
    ## type = "ph"   : Weibull distributed distributions, proportional hazards
    ##        "nph1" : exponential and Weibull distribution, non-proportional hazards
    ##        "nph2" : exponential and Weibull distribution, non-proportional hazards
    ##        "nph3" : exponential and Gompertz distribution, non-proportional hazards
    ##
    ## "ph" requires scalewei, shapewei and beta
    ## "nph1" requires scalewei, shapewei and scaleexp
    ## "nph2" requires scalewei, shapewei, scalewei2 and shapewei2
    ## "nph3" requires scaleexp, scalegom and shapegom
    ##
    ## scaleexpC and admincens: parameters for loss-to-follow-up and adminitrative censoring
    ##
    ## add.constant  : this number will be added to all times to prevent survival times of
    ##                 exactly 0.

    type <- match.arg(type)
    if (type == "ph")   {
        stopifnot(!is.null(scalewei),!is.null(shapewei),!is.null(beta))
    } else if (type == "nph1") {
        stopifnot(!is.null(scalewei),!is.null(shapewei),!is.null(scaleexp))
    } else if (type == "nph2") {
        stopifnot(!is.null(scalewei),!is.null(shapewei),!is.null(scalewei2),!is.null(shapewei2))
    } else if (type == "nph3") {
        stopifnot(!is.null(scaleexp),!is.null(scalegom),!is.null(shapegom))
    }

    set.seed(seed)

    ## 1) compute population c
    if (type != "ph") {
      if (type == "nph1") {
        integrandA <- function(x) { (scalewei * exp(-scalewei * x)) *
                                     exp(-scalewei * x ^ scalewei) }
      } else if (type == "nph2") {
        integrandA <- function(x) { (scalewei2 * shapewei2 * x ^ (shapewei2 - 1) *
                                     exp(-scalewei2 * x ^ shapewei2)) * exp(-scalewei *
                                     x ^ shapewei) }
      } else if (type == "nph3") {
        integrandA <- function(x) { scaleexp * exp(-scaleexp * x) *
                                    exp(scalegom / shapegom * (1 - exp(shapegom * x)))  }
      }
      popc100 <- rep(c(integrate(integrandA, lower = 0, upper = Inf)$value,
                       integrate(integrandA, lower = 0, upper = admincens[1])$value,
                       integrate(integrandA, lower = 0, upper = admincens[2])$value) * 100,
                     each = 2)
    } else { popc100 <- rep(exp(beta) / (1+exp(beta)), 6) * 100 }

    if (sim == 0) { output <- list(results = NA, olist = NA, popc100 = popc100) }

    ## 2) Kaplan-Meier plot of scenario
    xpop <- c(rep(0, npop / 2), rep(1, npop / 2))
    u <- runif(n = npop, min = 0, max = 1)

    if (type == "ph") {
      time1pop <- (-log(u[1:(npop / 2)]) / (scalewei * exp(beta * 0))) ^ (1 / shapewei)
      time2pop <- (-log(u[((npop / 2) + 1):npop]) / (scalewei * exp(beta * 1))) ^ (1 / shapewei)
    } else if (type == "nph1") {
      time1pop <- ((-log(u[1:(npop / 2)])) / scalewei) ^ (1 / shapewei)
      time2pop <- -log(u[((npop / 2) + 1):npop]) / scaleexp
    } else if (type == "nph2") {
      time1pop <- ((-log(u[1:(npop / 2)])) / scalewei) ^ (1 / shapewei)
      time2pop <- ((-log(u[((npop / 2) + 1):npop])) / scalewei2) ^ (1 / shapewei2)
    } else if (type == "nph3") {
      time1pop <- 1 / shapegom * log(1 - (shapegom * log(u[1:(npop / 2)])) / scalegom)
      time2pop <- -log(u[((npop / 2) + 1):npop]) / scaleexp
    }

    time1pop <- time1pop + addconstant
    time2pop <- time2pop + addconstant
    datapop <- data.frame(cbind(time = c(time1pop, time2pop), event = 1, x = xpop))

    fitpop <- coxph(Surv(time, event) ~ x, data = datapop)

    if (is.null(xmaxplot)) { xmaxplot <- max(datapop$time)  }

    par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
    plot(survfit(Surv(time, event) ~ x, data = datapop), lty = 1:2, lwd = 2,
         las = 1, xlim = c(0, xmaxplot))
    abline(v = admincens, col = "gray", lty = 2)
    mtext(side = 1, line = 2.5, text = "time", cex = 1.2)
    mtext(side = 2, line = 3, text = "survival distribution function",
          cex = 1.2)
    mtext(side = 3, line = -3, cex = 1.2, font = 2,
          text = if (type == "ph") { "proportional hazards scenario" } else {
          "non-proportional\nhazards scenario" } )

    ## 3) simulate data sets and analyse them
    if (sim != 0) {
      n <- n1 + n2
      out <- data.frame(matrix(NA, nrow = sim, ncol = 7, dimnames = list(1:(sim),
                        c("cens", "cox_beta", "cox_c100", "wcox_beta", "wcox_c100",
                          "wilcox100", "prt0st1"))))
      olist <- list(out = out, outC = out, out1 = out, outC1 = out, out2 = out, outC2 = out)
      x <- c(rep(0, n1), rep(1, n2))

      for (i in 1:sim) {
        cat(paste(".", sep = ""))

        ## simulate data without censoring (data), type 1
        u <- runif(n = n, min = 0, max = 1)

        if (type == "ph") {
          time1 <- (-log(u[1:n1]) / (scalewei * exp(beta * 0))) ^ (1 / shapewei)
          time2 <- (-log(u[(n1 + 1):n]) / (scalewei * exp(beta * 1))) ^ (1 / shapewei)
        } else if (type == "nph1") {
          time1 <- ((-log(u[1:n1])) / scalewei) ^ (1 / shapewei)
          time2 <- -log(u[(n1 + 1):n]) / scaleexp
        } else if (type == "nph2") {
          time1 <- ((-log(u[1:n1])) / scalewei) ^ (1 / shapewei)
          time2 <- ((-log(u[(n1 + 1):n])) / scalewei2) ^ (1 / shapewei2)
        } else if (type == "nph3") {
          time1 <- 1 / shapegom * log(1 - (shapegom * log(u[1:n1])) / scalegom)
          time2 <- -log(u[(n1 + 1):n]) / scaleexp
        }
        time1 <- time1 + addconstant
        time2 <- time2 + addconstant

        data <- data.frame(cbind(time = c(time1, time2), event = 1, x = x))

        fit1 <- coxph(Surv(time, event) ~ x, data = data)
        fit2 <-
          coxphw(Surv(time, event) ~ x, data = data)
        fit1zph <- cox.zph(fit = fit1, transform = "km")

        eg <- expand.grid(time1, time2)
        olist$out[i, ] <- c(
          0,
          fit1$coefficients, concord(fit1)[1],
          fit2$coefficients, concord(fit2)[1],
          wilcox.test(time ~ x, data = data, correct = FALSE)$statistic /
            (n1 * n2),
          1 - (sum(eg[, 1] < eg[, 2]) / nrow(eg)))

        ## follow-up distribution
        timecens <- (-log(runif(n = nrow(data), min = 0, max = 1)) / scaleexpC) + addconstant

        ## data with censoring (dataC), type 2
        dataC <- data
        dataC$time[data$time > timecens] <- timecens[data$time > timecens]
        dataC$event[data$time > timecens] <- 0
        censC <- sum(dataC$event == 0) / n * 100

        fit1C <- coxph(Surv(time, event) ~ x, data = dataC)
        fit2C <- coxphw(Surv(time, event) ~ x, data = dataC)

        dataC$id <- 1:nrow(dataC)

        wilcoxC <- wilcox.test(time ~ x, data = dataC, correct = FALSE)$statistic
        egC <- expand.grid(dataC$event[dataC$x == 0], dataC$event[dataC$x == 1])
        olist$outC[i, ] <- c(censC,
                             fit1C$coefficients, concord(fit1C)[1],
                             fit2C$coefficients, concord(fit2C)[1],
                             wilcoxC / (length(dataC$x[dataC$x == 0]) *
                                        length(dataC$x[dataC$x == 1])),
                             NA)

        ## data with administrative censoring 1 (data1), type 3
        data1 <- data
        data1$event[data$time > admincens[1]] <- 0
        data1$time[data$time > admincens[1]] <- admincens[1]
        cens1 <- sum(data1$event == 0) / n * 100

        fit11 <- coxph(Surv(time, event) ~ x, data = data1)
        fit21 <- coxphw(Surv(time, event) ~ x, data = data1)
        fit11zph <- cox.zph(fit = fit11, transform = "km")

        eg1 <- eg[!(eg[, 1] >= admincens[1] & eg[, 2] >= admincens[1]), ]
        wilcox1 <- wilcox.test(time ~ x, data = data1, correct = FALSE)$statistic
        olist$out1[i, ] <- c(cens1,
                             fit11$coefficients, concord(fit11)[1],
                             fit21$coefficients, concord(fit21)[1],
                             wilcox1 / (n1 * n2),
                             1 - ((sum(eg1[, 1] < eg1[, 2]) +
                                   sum(eg[, 1] >= admincens[1] &
                                       eg[, 2] >= admincens[1]) / 2) / nrow(eg)))

        ## data1 with censoring (datacens1), type 4
        dataC1 <- data1
        dataC1$time[data1$time > timecens] <- timecens[data1$time > timecens]
        dataC1$event[data1$time > timecens] <- 0
        censC1 <- sum(dataC1$event == 0) / n * 100

        fit1C1 <- coxph(Surv(time, event) ~ x, data = dataC1)
        fit2C1 <- coxphw(Surv(time, event) ~ x, data = dataC1)

        wilcoxC1 <- wilcox.test(time ~ x, data = dataC1, correct = FALSE)$statistic
        egC1 <- expand.grid(dataC1$event[dataC1$x == 0], dataC1$event[dataC1$x == 1])
        olist$outC1[i, ] <- c(censC1,
                              fit1C1$coefficients, concord(fit1C1)[1],
                              fit2C1$coefficients, concord(fit2C1)[1],
                              wilcoxC1 / (length(dataC1$x[dataC1$x == 0]) *
                                          length(dataC1$x[dataC1$x == 1])),
                              NA)

        ## data with administrative censoring 2 (data2), type 5
        data2 <- data
        data2$event[data$time > admincens[2]] <- 0
        data2$time[data$time > admincens[2]] <- admincens[2]
        cens2 <- sum(data2$event == 0) / n * 100

        fit12 <- coxph(Surv(time, event) ~ x, data = data2)
        fit22 <- coxphw(Surv(time, event) ~ x, data = data2)
        fit12zph <- cox.zph(fit = fit12, transform = "km")

        eg2 <- eg[!(eg[, 1] >= admincens[2] & eg[, 2] >= admincens[2]), ]
        wilcox2 <- wilcox.test(time ~ x, data = data2, correct = FALSE)$statistic
        olist$out2[i, ] <- c(cens2,
                             fit12$coefficients, concord(fit12)[1],
                             fit22$coefficients, concord(fit22)[1],
                             wilcox2 / (n1 * n2),
                             1 - ((sum(eg2[, 1] < eg2[, 2]) +
                                   sum(eg[, 1] >= admincens[2] &
                                       eg[, 2] >= admincens[2]) / 2) / nrow(eg)))

        ## data2 with censoring (datacens2), type 6
        dataC2 <- data2
        dataC2$time[data2$time > timecens] <- timecens[data2$time > timecens]
        dataC2$event[data2$time > timecens] <- 0
        censC2 <- sum(dataC2$event == 0) / n * 100

        fit1C2 <- coxph(Surv(time, event) ~ x, data = dataC2)
        fit2C2 <- coxphw(Surv(time, event) ~ x, data = dataC2)

        wilcoxC2 <- wilcox.test(time ~ x, data = dataC2, correct = FALSE)$statistic
        egC2 <- expand.grid(dataC2$event[dataC2$x == 0], dataC2$event[dataC2$x == 1])
        olist$outC2[i, ] <- c(censC2,
                              fit1C2$coefficients, concord(fit1C2)[1],
                              fit2C2$coefficients, concord(fit2C2)[1],
                              wilcoxC2 / (length(dataC2$x[dataC2$x == 0]) *
                                          length(dataC2$x[dataC2$x == 1])),
                              NA)
      }

      results <- matrix(NA, nrow = 6, ncol = 7, dimnames = list(c("No", "Loss-to-fup",
          "Admin. 1", "Loss-to-fup & admin. 1", "Admin. 2", "Loss-to-fup & admin. 2"),
          colnames(olist$out)))

      for (j in 1:6) {
        olist[[j]][, c("cox_c100", "wcox_c100", "wilcox100", "prt0st1")] <-
          olist[[j]][, c("cox_c100", "wcox_c100", "wilcox100", "prt0st1")] * 100

        r1 <- round(apply(olist[[j]], 2, mean), 3)
        r2 <- round(apply(olist[[j]], 2, sd) / sqrt(sim), 3)

        results[j, ] <- t(paste(r1, " (", r2, ")", sep = ""))
      }

      output <- list(results = results, olist = olist, popc100 = popc100)
    }

    invisible(output)
  }

## Section 5. Simulation
if (runSimulation) {
## Figure 3 and Table 1
if (pdfind) { pdf("simph.pdf", width = 5, height = 5) }
sim1 <- simulation(n1 = 1000, n2 = 1000, sim = 2000, seed = 3460, type = "ph",
                   scalewei = 0.11, shapewei = 1.22, scaleexpC =0.06029,
                   beta = log(0.55/(1-0.55)), admincens = c(11.21083, 9.549136),
                   npop = 10000, xmaxplot = 23, addconstant = 1e-4)
if (pdfind) { dev.off() }
print(sim1$results[, 1:6])
print(round(sim1$popc100[1], 2))        # true population-c * 100

if (pdfind) { pdf("simnph.pdf", width = 5, height = 5) }
sim2 <- simulation(n1 = 1000, n2 = 1000, sim = 2000, seed = 3458, type ="nph3",
                   scaleexp = 0.35653, shapegom = 1.6, scalegom = 0.0228,
                   scaleexpC = 0.122, admincens = c(4.506223, 3.535000),
                   npop = 10000,  xmaxplot = 6)
if (pdfind) { dev.off() }
print(sim2$results[, 1:6])
print(round(sim2$popc[1], 2))          # true population-c * 100
}

## ---- fig.width = 7, fig.height = 5--------------------------------------
## prepare Table 2
models <- c("Ignoring non-proportional hazards *", "HR Cox regression",
            "Estimating piecewise constant HRs *", "HR 1st year", "HR >1st year",
            "Including a time-by-covariate interaction", "HR at 0.5 years", "HR at 1 year",
            "HR at 2 years", "Weighted Cox regression", "average HR", "c'%")
Table2 <- data.frame(matrix(NA, nrow = length(models), ncol = 4, dimnames = list(models,
                     c("HR", "HRlower", "HRupper", "p"))))

## ignore non-proportional hazards and apply a Cox proportional hazards model
gfit2 <- coxphw(Surv(yrs, status) ~ radiation, data = gastric, template = "PH",
                robust = TRUE)

## or equivalently
coxph(Surv(yrs, status) ~ radiation + cluster(id), data = gastric, x = TRUE,
      method = "breslow")

## extract estimates for Table 1: HR, 95% CI, p-value
Table2["HR Cox regression", ] <- c(exp(gfit2$coeff),
                                   exp(confint(gfit2)),
                                   summary(gfit2)$prob)

## estimating piecewise constant hazard ratios (by two separate Cox models)
## (two time periods with equal number of events)

table(gastric$status)
## 79/2
nrow(subset(gastric, status == 1 & yrs < 1))          # breakpoint = 1 year

## first time period
gastricp1 <- gastric
gastricp1$status[gastricp1$yrs > 1] <- 0
gastricp1$yrs[gastricp1$yrs > 1] <- 1

nrow(gastricp1)

gtable0 <- table(gastricp1$status, deparse.level = 2)
gtable0
round(prop.table(gtable0) * 100, digits = 2)

gtable1 <- table(gastricp1$radiation, gastricp1$status, deparse.level = 2)
addmargins(gtable1)
round(prop.table(gtable1, margin = 1) * 100, digits = 2)

gfit3 <- coxph(Surv(yrs, status) ~ radiation + cluster(id), data = gastricp1,
               x = TRUE, method = "breslow")
gfit3.ph <- cox.zph(fit = gfit3, transform = "km")
gfit3.ph$table

## plot of scaled Schoenfeld residuals in the first time period
par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
plotcoxzph(x = gfit3.ph, wd = 2)
abline(a = 0, b = 0, lty = 3)
mtext(side = 1, line = 2.5, text = "time (years, KM-transformation)", cex = 1)
mtext(side = 2, line = 2.5, text = expression(paste(beta, "(t) for radiation")), cex = 1)
abline(lm(gfit3.ph$y ~ gfit3.ph$x)$coefficients, lty = 3, col = "red", lwd = 2)

## plot of cumulative survival probabilities
## gsurv2 <- survfit(Surv(yrs, status) ~ radiation, data = gastricp1)
## par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
## plot(gsurv2, lty = 1:2, las = 1, lwd = 2)
## mtext(side = 1, line = 2.5, text = "time (years)")
## mtext(side = 2, line = 3, text = "survival distribution function")
## legend("bottomleft", title = "radiation", legend = c("yes", "no"),
##        lty = 2:1, inset = 0.02, bty = "n", cex = 1.2)

## Cox proportional hazards model for the first time period
gfit4 <- coxphw(Surv(yrs, status) ~ radiation, data = gastricp1, template = "PH")
summary(gfit4)

Table2["HR 1st year", ] <- c(exp(gfit4$coeff),
                             exp(confint(gfit4)),
                             summary(gfit4, print = FALSE)$prob)

## or equivalently
## coxph(Surv(yrs, status) ~ radiation + cluster(id), data = gastricp1, method = "breslow")

## second time period
gastricp2 <- subset(gastric, yrs > 1)

nrow(gastricp2)

gtable0 <- table(gastricp2$status, deparse.level = 2)
gtable0
round(prop.table(gtable0) * 100, digits = 2)

gtable1 <- table(gastricp2$radiation, gastricp2$status, deparse.level = 2)
addmargins(gtable1)
round(prop.table(gtable1, margin = 1) * 100, digits = 2)

gfit5 <- coxph(Surv(yrs, status) ~ radiation + cluster(id), data = gastricp2, x = TRUE,
               method = "breslow")
gfit5.ph <- cox.zph(fit = gfit5, transform = "km")
gfit5.ph$table

## plot of scaled Schoenfeld residuals for the second time period
par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
plotcoxzph(x = gfit5.ph, wd = 2)
abline(a = 0, b = 0, lty = 3)
mtext(side = 1, line = 2.5, text = "time (years, KM-transformation)", cex = 1)
mtext(side = 2, line = 2.5, text = expression(paste(beta, "(t) for radiation")), cex = 1)
abline(lm(gfit5.ph$y ~ gfit5.ph$x)$coefficients, lty = 3, col = "red", lwd = 2)

## plot of cumulative survival probabilities
## gsurv3 <- survfit(Surv(yrs, status) ~ radiation, data = gastricp2)
## par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
## plot(gsurv3, lty = 1:2, las = 1, lwd = 2, xlim=c(1,5))
## mtext(side = 1, line = 2.5, text = "time (years)")
## mtext(side = 2, line = 3, text = "survival distribution function")
## legend("bottomleft", title = "radiation", legend = c("yes", "no"),
##        lty = 2:1, inset = 0.02, bty = "n", cex = 1.2)

## Cox proportional hazards model for the second time period
gfit6 <- coxphw(Surv(yrs, status) ~ radiation, data = gastricp2, template = "PH")
summary(gfit6)

Table2["HR >1st year", ] <- c(exp(gfit6$coeff),
                              exp(confint(gfit6)),
                              summary(gfit6, print = FALSE)$prob)

## or equivalently
## coxph(Surv(yrs, status) ~ radiation + cluster(id), data = gastricp2, method = "breslow")

## including a time-by-covariate interaction
fun <- function(t) as.numeric(t > 1)

gfit7 <- coxphw(Surv(yrs, status) ~ radiation + fun(yrs):radiation, data = gastric, template = "PH")
summary(gfit7)
## 2.4046734 * 0.2270505
## exp(0.8774141 - 1.4825829)

## or equivalently
summary(coxph(Surv(yrs, status) ~ radiation + tt(radiation) + cluster(id), data = gastric,
              tt = function(x, t, ...) x * (t > 1), method = "breslow"))

## extended Cox model - assume a linear time-dependent effect
fit1 <- coxphw(Surv(yrs, status) ~ radiation + yrs:radiation, data = gastric, template = "PH")
summary(fit1)

## or equivalently
coxph(Surv(yrs, status) ~ radiation + tt(radiation) + cluster(id), tt = function(x,t, ...) x * t,
     data = gastric, method = "breslow")

## extract HR at 0.5, 1 and 2 years
fit1est <- predict(fit1, type = "slice.time", x = "yrs", z = "radiation", newx = c(0.5, 1, 2),
                   exp = TRUE, verbose = TRUE, pval = TRUE)

Table2[c("HR at 0.5 years", "HR at 1 year",
         "HR at 2 years"), ] <- cbind(fit1est$estimates[, "HR"],
                                      fit1est$estimates[, "HR lower 0.95"],
                                      fit1est$estimates[, "HR upper 0.95"],
                                      fit1est$estimates[, "p"])

## visualize the estimated linear time-dependent effect
fit1est2 <- predict(fit1, type = "slice.time", x = "yrs", z = "radiation",
                    newx = seq(from = 0.1, to = 3, by = 0.1))

if (pdfind) { pdf("figure3.pdf", width = 7, height = 5) }
  par(oma = c(2, 2, 0.5, 0.5), mar=c(2, 2, 0, 0))
  plot(fit1est2, addci = TRUE)
  mtext(side = 1, line = 2.5, text = "time (yrs)", cex = 1.3)
  mtext(side = 2, line = 2.3, text = expression(paste(hat(beta), "(t) for radiation")),
        cex = 1.3)
if (pdfind) { dev.off() }

## extended Cox model - assume a log-linear time-dependent effect
gfit8 <- coxphw(Surv(yrs, status) ~ radiation + log(yrs):radiation, data = gastric,
                template = "PH")
summary(gfit8)

## or equivalently
coxph(Surv(yrs, status) ~ radiation + tt(radiation) + cluster(id),
     tt = function(x, t, ...) x * log(t), data = gastric, method = "breslow")

## weighted Cox regression 
fit2 <- coxphw(Surv(yrs, status) ~ radiation, data = gastric, template = "AHR")
summary(fit2)

## weighted Cox regression with truncation of weights
gfit9 <- coxphw(Surv(yrs, status) ~ radiation, data = gastric, template = "AHR",
                  trunc.weights = 0.95)
summary(gfit9)

if (pdfind) { pdf(file = "figure4.pdf", width = 6, height = 5) }
  par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
  plot(x = gfit9, las = 1, lwd = 2)
  mtext(side = 1, line = 2.5, text = "time (years)")
  mtext(side = 2, line = 2.5, text = "weight")
if (pdfind) { dev.off() }

## range of normalized totatl weights
range(gfit9$w.matrix[, "w"])

Table2["average HR", ] <- cbind(exp(gfit9$coeff),
                                exp(confint(gfit9)),
                                summary(gfit9, print = FALSE)$prob)
Table2["c'%", ] <- c(as.vector(concord(gfit9)), summary(gfit9, print = FALSE)$prob)

## finish Table 1
Table2["c'%", 1:3] <- 100 * Table2["c'%", 1:3]
Table2 <- round(Table2, digits = 3)

Table2[, 1] <- paste(Table2[, 1], " (", Table2[, 2], "-", Table2[, 3], ")", sep = "")
Table2[, 2] <- Table2[, 4]
Table2 <- Table2[, 1:2]
dimnames(Table2)[[2]] <- c("Estimate (95% CI)", "p")
Table2

## ---- fig.width = 7, fig.height = 5--------------------------------------
## ignore non-proportional hazards and apply a Cox model
## (use breslow weights to make it directly comparable to coxphw)
bfit2 <- coxphw(Surv(thdur, success) ~ bfb + log2heal, data = biofeedback, template = "PH")
summary(bfit2)

## or equivalently
coxph(Surv(thdur, success) ~ bfb + log2heal + cluster(id), data = biofeedback,
      x = TRUE, method = "breslow")

## two stage estimation
stage1 <- coxph(Surv(thdur, success) ~ strata(bfb) + log2heal + tt(log2heal) + cluster(id),
                tt = function(x, t, ...) x * log(t), data = biofeedback, method = "breslow")
summary(stage1)

## for comparison linear time-dependent effect
coxph(Surv(thdur, success) ~ strata(bfb) + log2heal + tt(log2heal) + cluster(id),
      tt = function(x, t, ...) x * t, data = biofeedback, method = "breslow")

stage2 <- coxphw(Surv(thdur, success) ~ bfb + log2heal + log(thdur):log2heal, data = biofeedback,
                template = "AHR", betafix = c(NA, coef(stage1)))
summary(stage2)

if (pdfind) { pdf(file = "figure5.pdf", width = 6, height = 5) }
  par(oma = c(2, 2, 0.5, 0.5), mar = c(2, 2, 0, 0))
  plot(x = stage2, las = 1, legendxy = c(45, 1.15), lwd = 2)
  mtext(side = 1, line = 2.5, text = "treatment duration (days)")
  mtext(side = 2, line = 2.5, text = "weight")
if (pdfind) { dev.off() }

