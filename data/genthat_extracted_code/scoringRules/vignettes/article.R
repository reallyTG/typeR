## ----preliminaries, echo=FALSE, results='hide'----------------------
# Using knitr for manuscript
library(knitr)
render_sweave()
opts_chunk$set(engine='R', tidy=FALSE)

# JSS code formatting
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)

# Formatting
options(scipen = 1, digits = 3)
Sys.setenv(LANG = 'en')

# RNG initialization
set.seed(42)

# Required packages
library(scoringRules)
library(crch)

## ----Section-Package-design-and-functionality, echo=FALSE-----------

## ----Subsection-Parametric-predictive-distribution, echo=FALSE------

## ----Parametric-score-example-1-------------------------------------
library("scoringRules")
obs <- rnorm(10)
crps(obs, "norm", mean = c(1:10), sd = c(1:10))
crps_norm(obs, mean = c(1:10), sd = c(1:10))

## ----Parametric-score-example-3-------------------------------------
crps_y <- function(y) crps_gamma(y, shape = 2, scale = 1.5)
logs_y <- function(y) logs_gamma(y, shape = 2, scale = 1.5)

## ----Parametric-score-illustration, echo=FALSE, dev='pdf', fig.width=10.4, fig.height=4.1, fig.align="center", out.width = "\\linewidth"----
# Initialize plot
par(mai = c(0.9, 3.5, 0.3, 3.4), cex = 1.1)
plot(NULL, type = "n", bty = "n",
  xlim = c(0, 9), ylim = c(0, 5),
  xlab = "Observation y", ylab = "Score value",
  xaxt = "n", yaxt = "n")
axis(1, at = c(0, 4, 8))
axis(2, at = c(0, 2.5, 5))

# Draw predictive density in background
z <- seq(0, 9, .01)
bg <- 15 * dgamma(z, shape = 2, scale = 1.5)
polygon(c(z, rev(z)), c(rep(0, length(bg)), rev(bg)), 
  col="gray80", border="gray80")

# Add legend
legend("top", bty = "n", legend = c("LogS", "CRPS"), 
  col = c("purple", "darkorange"),
  lty = c(1, 1), lwd = c(2, 2))
  
# Add score functions
plot(crps_y, from = 0, to = 9, col = "darkorange", lwd = 2, add = TRUE)
plot(logs_y, from = 0, to = 9, col = "purple", lwd = 2, add = TRUE)

## ----Subsection-Simulated-predictive-distribution, echo=FALSE-------

## ----Simulated-score-example-1--------------------------------------
obs_n <- c(0, 1, 2)
sample_nm <- matrix(rnorm(3e4, mean = 2, sd = 3), nrow = 3)
crps_sample(obs_n, dat = sample_nm)
logs_sample(obs_n, dat = sample_nm)

## ----Simulated-score-example-2--------------------------------------
R <- 500
M <- 5e3
mgrid <- exp(seq(log(50), log(M), length.out = 51))
crps_approx <- matrix(NA, nrow = R, ncol = length(mgrid))
logs_approx <- matrix(NA, nrow = R, ncol = length(mgrid))
obs_1 <- 2
for (r in 1:R) {
  sample_M <- rnorm(M, mean = 2, sd = 3)
  for (i in seq_along(mgrid)) {
    m <- mgrid[i]
    crps_approx[r, i] <- crps_sample(obs_1, dat = sample_M[1:m])
    logs_approx[r, i] <- logs_sample(obs_1, dat = sample_M[1:m])
  }
}

## ----Simulated-score-illustration, echo=FALSE, dev='pdf', fig.width=10.4, fig.height=4.2, fig.align ="center", out.width = "\\linewidth"----
crps_true <- crps(obs_1, family = "normal", mean = 2, sd = 3)
logs_true <- logs(obs_1, family = "normal", mean = 2, sd = 3)

par(mai = c(.9, .9, .3, .3), pty = "s", cex = 1.1, omi = c(0, .7, 0, 1.3))
layout(matrix(1:2, nrow = 1))

# CRPS plot
norm <- quantile(crps_approx[, 1], probs = 0.95) - 
  quantile(crps_approx[, 2], probs = 0.05)
plot(NULL, type = "n", bty = "n",
     main = "CRPS", xlab = "Sample size", ylab = "Score value",
     xlim = c(min(mgrid), max(mgrid)),
     ylim = crps_true + c(-1, 1) * 0.8 * norm,
     xaxt = "n", yaxt = "n", log = "x")
axis(1, at = c(50, 500, 5000))
axis(2, at = c(.5, .7, .9))
polygon(c(mgrid, rev(mgrid)),
        c(apply(crps_approx, 2, quantile, probs = 0.95),
          rev(apply(crps_approx, 2, quantile, probs = 0.05))),
        col = "lightgrey", border = NA)
lines(mgrid, apply(crps_approx, 2, mean), col = "darkgrey", lwd = 2)
abline(h = crps_true, lty = 2)
lines(mgrid, crps_approx[1, ], col = "darkorange", lwd = 2)


# LogS plot
norm <- quantile(logs_approx[, 1], probs = 0.95) -
  quantile(logs_approx[, 2], probs = 0.05)
plot(NULL, type = "n", bty = "n",
     main = "LogS", xlab = "Sample size", ylab = "",
     xlim = c(min(mgrid), max(mgrid)),
     ylim = logs_true + c(-1, 1) * .8 * norm,
     xaxt = "n", yaxt = "n", log = "x")
axis(1, at = c(50, 500, 5000))
axis(2, at = c(1.7, 2.0, 2.3))
polygon(c(mgrid, rev(mgrid)),
        c(apply(logs_approx, 2, quantile, probs = 0.95),
          rev(apply(logs_approx, 2, quantile, probs = 0.05))),
        col = "lightgrey", border = NA)
lines(mgrid, apply(logs_approx, 2, mean), col = "darkgrey", lwd = 2)
abline(h = logs_true, lty = 2)
lines(mgrid, logs_approx[1, ], col = "purple", lwd = 2)

## ----Section-Usage-examples, echo=FALSE-----------------------------

## ----Subsection-Probabilistic-weather-forecasting-via-ensemble-post-processing, echo=FALSE----

## ----Prepare-post-processing-example--------------------------------
library("crch")
data("RainIbk", package = "crch")
RainIbk <- sqrt(RainIbk)
ensfc <- RainIbk[, grep('^rainfc', names(RainIbk))]
RainIbk$ensmean <- apply(ensfc, 1, mean)
RainIbk$enssd <- apply(ensfc, 1, sd)
RainIbk <- subset(RainIbk, enssd > 0)

## ----Splitting-data-------------------------------------------------
data_train <- subset(RainIbk, as.Date(rownames(RainIbk)) <= "2004-11-30")
data_eval <- subset(RainIbk, as.Date(rownames(RainIbk)) >= "2005-01-01")

## ----Forecasting-Gauss----------------------------------------------
CRCHgauss <- crch(rain ~ ensmean | log(enssd), data_train,
  dist = "gaussian", left = 0)
gauss_mu <- predict(CRCHgauss, data_eval, type = "location")
gauss_sc <- predict(CRCHgauss, data_eval, type = "scale")

## ----Forecasting-logis-stud, echo=FALSE-----------------------------
CRCHlogis <- crch(rain ~ ensmean | log(enssd), data = data_train, 
left = 0, dist = "logistic")
CRCHstud <- crch(rain ~ ensmean | log(enssd), data = data_train, 
left = 0, dist = "student")
logis_mu <- predict(CRCHlogis, data_eval, type = "location")
logis_sc <- predict(CRCHlogis, data_eval, type = "scale")
stud_mu <- predict(CRCHstud, data_eval, type = "location")
stud_sc <- predict(CRCHstud, data_eval, type = "scale")
stud_df <- CRCHstud$df

## ----Forecasting-raw------------------------------------------------
ens_fc <- data_eval[, grep('^rainfc', names(RainIbk))]

## ----Post-processing-example-illustration, echo=FALSE, dev='pdf', fig.width=10.4, fig.height = 3.7, fig.align="center", out.width="\\linewidth"----
# Layout
m <- matrix(c(1, 2, 3), nrow = 1)
layout(mat = m, widths = c(3.55, 2.95, 3.90))
par(pty = "s", cex = 1.1)

# Looping through forecast cases
ID.list <- c(206,953,2564)
for(ID in ID.list){
  col.logis <- "blue"
  col.gauss <- "green3"
  col.stud <- "darkorange"

  # Forecast densities
  z <- seq(0,10,0.01)
  flogis.plot <- suppressWarnings(
    flogis(z, logis_mu[ID], logis_sc[ID], lower = 0, lmass = "cens"))
  flogis.p0 <- plogis(0, logis_mu[ID], logis_sc[ID])
  fnorm.plot <- suppressWarnings(
    fnorm(z, gauss_mu[ID], gauss_sc[ID], lower = 0, lmass = "cens"))
  fnorm.p0 <- pnorm(0, gauss_mu[ID], gauss_sc[ID])
  fstud.plot <- suppressWarnings(
    ft(z, stud_df, stud_mu[ID], stud_sc[ID], lower = 0, lmass = "cens"))
  fstud.p0 <- pt(-stud_mu[ID] / stud_sc[ID], stud_df)

  # Reset margins  
  if (ID == ID.list[1]) par(mai = c(0.9, 0.9, 0.3, 0.15))
  if (ID == ID.list[2]) par(mai = c(0.9, 0.3, 0.3, 0.15))
  if (ID == ID.list[3]) par(mai = c(0.9, 0.3, 0.3, 1.1))
  
  # Initializing plot
  plot(NULL, type = "n", bty = "n", xaxt = "n", yaxt = "n",
    ylim = c(-0.025, 0.5), xlim = c(-0.4,10),
    xlab = "Precipitation amount in mm",
	ylab = ifelse(ID == ID.list[1], "Density", ""),
	main = rownames(data_eval)[ID])
  axis(1, at = c(0, 5, 10))
  if (ID == ID.list[1]) axis(2, at = c(0, 0.25, 0.5))
  
  # Add predictive densities
  lines(z, flogis.plot, col = col.logis)
  lines(z, fnorm.plot, col = col.gauss)
  lines(z, fstud.plot, col = col.stud)	  

  # Add segments for point mass at zero
  p0.offset <- 0.2
  segments(0, 0, 0, flogis.p0, col = col.logis, lwd = 3)	  
  segments(-p0.offset, 0, -p0.offset, fnorm.p0, col = col.gauss, lwd = 3)	  
  segments(-2*p0.offset, 0, -2*p0.offset, fstud.p0, col = col.stud, lwd = 3)
	  
  # Add observation
  segments(data_eval$rain[ID], 0, data_eval$rain[ID], 0.5, lty = 2)
	  
  # Add ensemble forecast
  ens.fc <- as.numeric(data_eval[, grep('^rainfc',names(RainIbk))][ID,])
  for (j in 1:length(ens.fc)) {
    segments(ens.fc[j], -0.025, ens.fc[j], -0.005)
  }
}

# Add legend
par(xpd = TRUE)
legend(6.5, .45, bty = "n",
  legend = c("cens. logistic", "cens. Gaussian", "cens. Student's t"),
  col = c("blue", "green3", "darkorange"),
  lty = rep(1,3), ncol = 1)

## ----Computing-scores-Gauss-----------------------------------------
obs <- data_eval$rain
gauss_crps <- crps(obs, family = "cnorm", location = gauss_mu, 
  scale = gauss_sc, lower = 0, upper = Inf)
ens_crps <- crps_sample(obs, dat = as.matrix(ens_fc))

## ----Computing-scores-logis-stud, echo=FALSE------------------------
logis_crps <- crps(obs, family = "clogis", location = logis_mu, 
scale = logis_sc, lower = 0, upper = Inf)
stud_crps <- crps(obs, family = "ct", df = stud_df, location = stud_mu, 
scale = stud_sc, lower = 0, upper = Inf)

## ----Calculating-average-scores-------------------------------------
scores <- data.frame(CRCHlogis = logis_crps, CRCHgauss = gauss_crps,
  CRCHstud = stud_crps, Ensemble = ens_crps)
sapply(scores, mean)

## ----Subsection-Bayesian-forecasts-of-US-GDP-growth-rate, echo=FALSE----

## ----Data-MCMC-example----------------------------------------------
data("gdp", package = "scoringRules")
data_train <- subset(gdp, vint == "2014Q1")
data_eval <- subset(gdp, vint == "2015Q1" & grepl("2014", dt))

## ----Sampling-MCMC-forecast-parameters------------------------------
h <- 4
m <- 20000
fc_params <- ar_ms(data_train$val, forecast_periods = h, n_rep = m)

## ----Regularize-forecast-parameter-data-format----------------------
mu <- t(fc_params$fcMeans)
Sd <- t(fc_params$fcSds)

## ----Sampling-ensemble-forecast-from-MCMC-forecast------------------
X <- matrix(rnorm(h * m, mean = mu, sd = Sd), nrow = h, ncol = m)

## ----MCMC-example-illustration, echo=FALSE, dev='pdf', fig.width=10.4, fig.height = 3.2, fig.align = "center", out.width="\\linewidth"----
# Mixture density function constructor
fmix <- function(m, s) {
  function(x) {
    40000 * sapply(x, function(z) mean(dnorm(z, mean = m, sd = s)))
  }
}

# Layout
layout(mat = matrix(1:4, nrow = 1), widths = c(3.05, 2.45, 2.45, 2.45))
par(mai = c(0.9, 0.9, 0.3, 0.15), pty = "s", cex = 1.1)

# Loop through forecast cases
for (jj in seq_along(data_eval$dt)) {
  # Get observation and created ensemble forecast
  act <- data_eval$val[jj]
  x <- X[jj, ]

  # Histogram for ensemble forecast
  hist(x, xaxt = "n", yaxt = "n", main = data_eval$dt[jj],
    xlab = "Growth rate in %", ylab = ifelse(jj == 1, "Frequency", ""),
    xlim = c(-10, 15), ylim = c(0, 8000))
  axis(1, at = c(-10, 0, 15))
  if (jj == 1) axis(2, at = c(0, 4000, 8000))
  
  # Add observation
  segments(act, 0, act, 8000, lty = 2)
  # Add mixture-of-parameters density
  plot(fmix(mu[jj, ], Sd[jj, ]), from = min(x), to = max(x), lwd = 2, add = TRUE)

  # Reduce extra spacing (y-axis) for remaining plots
  if (jj == 1) par(mai = c(0.9, 0.3, 0.3, 0.15))
}

## ----MCMC-example-scores--------------------------------------------
obs <- data_eval$val
names(obs) <- data_eval$dt
w <- matrix(1/m, nrow = h, ncol = m)
crps_mpe <- crps(obs, "normal-mixture", m = mu, s = Sd, w = w)
logs_mpe <- logs(obs, "normal-mixture", m = mu, s = Sd, w = w)
crps_ecdf <- crps_sample(obs, X)
logs_kde <- logs_sample(obs, X)
print(cbind(crps_mpe, crps_ecdf, logs_mpe, logs_kde))

## ----Subsection-Parameter-estimation-with-scoring-rules, echo=FALSE----

## ----wrapper-functions-optim----------------------------------------
meancrps <- function(y_train, param) mean(crps_norm(y = y_train,
  mean = param[1], sd = param[2]))
grad_meancrps <- function(y_train, param) apply(gradcrps_norm(y_train,
  param[1], param[2]), 2, mean)

## ----parameter-estimation-simulation--------------------------------
R <- 1000
n <- 500
mu_true <- -1
sigma_true <- 2
estimates_ml <- matrix(NA, nrow = R, ncol = 2)
estimates_crps <- matrix(NA, nrow = R, ncol = 2)  
for (r in 1:R) {
  dat <- rnorm(n, mu_true, sigma_true)
  estimates_crps[r, ] <- optim(par = c(1, 1), fn = meancrps,
    gr = grad_meancrps, method = "BFGS", y_train = dat)$par
  estimates_ml[r, ] <- c(mean(dat), sd(dat) * sqrt((n - 1) / n))
}

## ----parameter-estimation-simulation-results, echo=FALSE, dev='pdf', fig.width=10.4, fig.height=3.5, fig.align = "center", out.width="\\linewidth"----
# differences between estimates and true parameter values
dfc <- data.frame(mean = estimates_crps[, 1] - mu_true, sd =
  estimates_crps[, 2] - sigma_true, score = "CRPS")
dfl <- data.frame(mean = estimates_ml[, 1] - mu_true, sd =
  estimates_ml[,2] - sigma_true, score = "LogS")
dfdiff <- rbind(dfc, dfl)

# boxplot mean parameter
plotlim <- c(-.35,.35)
par(mfrow = c(1, 2), mar = c(4, 2, 2, 2))
boxplot(mean ~ score, data = dfdiff, ylim = plotlim, main =
  expression(hat(mu) - mu), horizontal = TRUE, las = 1, xlab =
  "Deviation from the true value", boxwex = 0.25, axes = F,
  border = c("darkorange", "purple"))
axis(1, c(-0.3, 0, 0.3))
abline(v = 0, lty = 2)

# boxplot sd parameter
boxplot(sd ~ score, data = dfdiff, ylim = plotlim, main =
  expression(hat(sigma) - sigma), horizontal = TRUE, las = 1,
  xlab = "Deviation from the true value", boxwex = 0.25,
  axes = F, border = c("darkorange", "purple"))
axis(1, c(-0.3, 0, 0.3))
axis(2, c(1, 2), labels = c("CRPS", "LogS"), lwd = 0, las = 1)
abline(v = 0, lty = 2)

## ----Section-Multivariate-scoring-rules, echo=FALSE-----------------

## ----Simulated-score-multivariate-example---------------------------
names(obs) <- NULL
es_sample(obs, dat = X)
vs_sample(obs, dat = X)

## ----multiple-multivariate-forecasts-parameters-1-------------------
d <- 10
mu <- rep(0, d)
Sigma <- diag(d)
Sigma[!diag(d)] <- 0.2

## ----multiple-multivariate-forecasts-parameters-2-------------------
m <- 50
mu_f <- rep(1, d)
Sigma_f <- diag(d)
Sigma_f[!diag(d)] <- 0.1

## ----multiple-multivariate-forecasts-generation---------------------
n <- 1000
fc_obs_list <- vector("list", n)
obs_array <- matrix(NA, nrow = d, ncol = n)
fc_array <- array(NA, dim = c(d, m, n))
for (fc_case in 1:n) {
  obs_tmp <- drop(mu + rnorm(d) %*% chol(Sigma))
  fc_tmp <- replicate(m, drop(mu_f + rnorm(d) %*% chol(Sigma_f)))
  fc_obs_list[[fc_case]] <- list(obs = obs_tmp, fc_sample = fc_tmp)
  obs_array[, fc_case] <- obs_tmp
  fc_array[, , fc_case] <- fc_tmp
}

## ----multiple-multivariate-forecasts-evaluation---------------------
es_vec_list <- sapply(fc_obs_list, function(x) es_sample(y = x$obs,
  dat = x$fc_sample))
es_vec_array <- sapply(1:n, function(i) es_sample(y = obs_array[, i],
  dat = fc_array[, , i]))
head(cbind(es_vec_list, es_vec_array))

