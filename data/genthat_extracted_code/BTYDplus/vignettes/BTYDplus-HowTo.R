## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(BTYDplus)
data("groceryElog")

## ---- fig.show="hold", fig.width=7, fig.height=2.8, fig.cap="Timing patterns for sampled grocery customers"----
library(BTYDplus)
data("groceryElog")
set.seed(123)
# plot timing patterns of 30 sampled customers
plotTimingPatterns(groceryElog, n = 30, T.cal = "2007-05-15",
                   headers = c("Past", "Future"), title = "")

## ---- echo=FALSE, results="asis"-----------------------------------------
cdnowElog <- read.csv(system.file("data/cdnowElog.csv", package = "BTYD"),
                      stringsAsFactors = FALSE,
                      col.names = c("cust", "sampleid", "date", "cds", "sales"))
cdnowElog$date <- as.Date(as.character(cdnowElog$date), format = "%Y%m%d")
knitr::kable(head(cdnowElog[, c("cust", "date", "sales")], 6), caption = "Transaction Log Example")

## ---- fig.show="hold", fig.width=7, fig.height=2.5, fig.cap="Weekly trends for the grocery dataset"----
data("groceryElog")
op <- par(mfrow = c(1, 2), mar = c(2.5, 2.5, 2.5, 2.5))
# incremental
weekly_inc_total  <- elog2inc(groceryElog, by = 7, first = TRUE)
weekly_inc_repeat <- elog2inc(groceryElog, by = 7, first = FALSE)
plot(weekly_inc_total, typ = "l", frame = FALSE, main = "Incremental")
lines(weekly_inc_repeat, col = "red")
# cumulative
weekly_cum_total  <- elog2cum(groceryElog, by = 7, first = TRUE)
weekly_cum_repeat <- elog2cum(groceryElog, by = 7, first = FALSE)
plot(weekly_cum_total, typ = "l", frame = FALSE, main = "Cumulative")
lines(weekly_cum_repeat, col = "red")
par(op)

## ------------------------------------------------------------------------
data("groceryElog")
head(elog2cbs(groceryElog), 5)

## ------------------------------------------------------------------------
data("groceryElog")
range(groceryElog$date)
groceryCBS <- elog2cbs(groceryElog, T.cal = "2006-12-31")
head(groceryCBS, 5)

## ---- fig.show="hold", fig.width=7, fig.height=2.2, fig.cap="Diagnostic plots for estimating regularity"----
data("groceryElog")
op <- par(mfrow = c(1, 2))
(k.wheat <- estimateRegularity(groceryElog, method = "wheat", 
                              plot = TRUE, title = "Wheat & Morrison"))
(k.mle <- estimateRegularity(groceryElog, method = "mle", 
                             plot = TRUE, title = "Maximum Likelihood"))
par(op)

## ------------------------------------------------------------------------
# load grocery dataset, if it hasn't been done before
if (!exists("groceryCBS")) {
  data("groceryElog")
  groceryCBS <- elog2cbs(groceryElog, T.cal = "2006-12-31")
}
# estimate NBD parameters
round(params.nbd <- nbd.EstimateParameters(groceryCBS), 3)
# report log-likelihood
nbd.cbs.LL(params.nbd, groceryCBS)

## ------------------------------------------------------------------------
# calculate expected future transactions for customers who've 
# had 1 to 5 transactions in first 52 weeks
est5.nbd <- nbd.ConditionalExpectedTransactions(params.nbd, 
              T.star = 52, x = 1:5, T.cal = 52)
for (i in 1:5) {
  cat("x =", i, ":", sprintf("%5.3f", est5.nbd[i]), "\n")
}

## ------------------------------------------------------------------------
# predict whole customer cohort
groceryCBS$xstar.nbd <- nbd.ConditionalExpectedTransactions(
                    params = params.nbd, T.star = 52, 
                    x = groceryCBS$x, T.cal = groceryCBS$T.cal)
# compare predictions with actuals at aggregated level
rbind(`Actuals` = c(`Holdout` = sum(groceryCBS$x.star)), 
      `NBD`     = c(`Holdout` = round(sum(groceryCBS$xstar.nbd))))

## ------------------------------------------------------------------------
# load grocery dataset, if it hasn't been done before
if (!exists("groceryCBS")) {
  data("groceryElog")
  groceryCBS <- elog2cbs(groceryElog, T.cal = "2006-12-31")
}
# estimate Pareto/NBD parameters
params.pnbd <- BTYD::pnbd.EstimateParameters(groceryCBS)
names(params.pnbd) <- c("r", "alpha", "s", "beta")
round(params.pnbd, 3)
# report log-likelihood
BTYD::pnbd.cbs.LL(params.pnbd, groceryCBS)

## ------------------------------------------------------------------------
# calculate expected future transactions for customers who've 
# had 1 to 5 transactions in first 12 weeks, but then remained
# inactive for 40 weeks
est5.pnbd <- BTYD::pnbd.ConditionalExpectedTransactions(params.pnbd, 
               T.star = 52, x = 1:5, t.x = 12, T.cal = 52)
for (i in 1:5) {
  cat("x =", i, ":", sprintf("%5.3f", est5.pnbd[i]), "\n")
}

## ------------------------------------------------------------------------
# predict whole customer cohort
groceryCBS$xstar.pnbd <- BTYD::pnbd.ConditionalExpectedTransactions(
                     params = params.pnbd, T.star = 52, 
                     x = groceryCBS$x, t.x = groceryCBS$t.x,
                     T.cal = groceryCBS$T.cal)
# compare predictions with actuals at aggregated level
rbind(`Actuals`    = c(`Holdout` = sum(groceryCBS$x.star)), 
      `Pareto/NBD` = c(`Holdout` = round(sum(groceryCBS$xstar.pnbd))))

## ------------------------------------------------------------------------
# P(alive) for customers who've had 1 to 5 transactions in first 
# 12 weeks, but then remained inactive for 40 weeks
palive.pnbd <- BTYD::pnbd.PAlive(params.pnbd, 
                 x = 1:5, t.x = 12, T.cal = 52)
for (i in 1:5) {
  cat("x =", i, ":", sprintf("%5.2f %%", 100*palive.pnbd[i]), "\n")
}

## ------------------------------------------------------------------------
# load grocery dataset, if it hasn't been done before
if (!exists("groceryCBS")) {
  data("groceryElog")
  groceryCBS <- elog2cbs(groceryElog, T.cal = "2006-12-31")
}
# estimate parameters for various models
params.bgnbd   <- BTYD::bgnbd.EstimateParameters(groceryCBS) # BG/NBD
params.bgcnbd  <- bgcnbd.EstimateParameters(groceryCBS)      # BG/CNBD-k
params.mbgnbd  <- mbgnbd.EstimateParameters(groceryCBS)      # MBG/NBD
params.mbgcnbd <- mbgcnbd.EstimateParameters(groceryCBS)     # MBG/CNBD-k
row <- function(params, LL) { 
  names(params) <- c("k", "r", "alpha", "a", "b")
  c(round(params, 3), LL = round(LL))
}
rbind(`BG/NBD`     = row(c(1, params.bgnbd), 
                         BTYD::bgnbd.cbs.LL(params.bgnbd, groceryCBS)),
      `BG/CNBD-k`  = row(params.bgcnbd, 
                         bgcnbd.cbs.LL(params.bgcnbd, groceryCBS)),
      `MBG/NBD`    = row(params.mbgnbd, 
                         mbgcnbd.cbs.LL(params.mbgnbd, groceryCBS)),
      `MBG/CNBD-k` = row(params.mbgcnbd, 
                         mbgcnbd.cbs.LL(params.mbgcnbd, groceryCBS)))

## ------------------------------------------------------------------------
# calculate expected future transactions for customers who've 
# had 1 to 5 transactions in first 12 weeks, but then remained
# inactive for 40 weeks
est5.mbgcnbd <- mbgcnbd.ConditionalExpectedTransactions(params.mbgcnbd,
                  T.star = 52, x = 1:5, t.x = 12, T.cal = 52)
for (i in 1:5) {
  cat("x =", i, ":", sprintf("%5.3f", est5.mbgcnbd[i]), "\n")
}

## ------------------------------------------------------------------------
# P(alive) for customers who've had 1 to 5 transactions in first 
# 12 weeks, but then remained inactive for 40 weeks
palive.mbgcnbd <- mbgcnbd.PAlive(params.mbgcnbd, 
                    x = 1:5, t.x = 12, T.cal = 52)
for (i in 1:5) {
  cat("x =", i, ":", sprintf("%5.2f %%", 100*palive.mbgcnbd[i]), "\n")
}

## ------------------------------------------------------------------------
# predict whole customer cohort
groceryCBS$xstar.mbgcnbd <- mbgcnbd.ConditionalExpectedTransactions(
                        params = params.mbgcnbd, T.star = 52,
                        x = groceryCBS$x, t.x = groceryCBS$t.x, 
                        T.cal = groceryCBS$T.cal)
# compare predictions with actuals at aggregated level
rbind(`Actuals`    = c(`Holdout` = sum(groceryCBS$x.star)),
      `MBG/CNBD-k` = c(`Holdout` = round(sum(groceryCBS$xstar.mbgcnbd))))

## ---- fig.show="hold", fig.width=4, fig.height=3.5, fig.cap="Weekly actuals vs. MBG/CNBD-k predictions"----
# runs for ~37secs on a 2015 MacBook Pro
nil <- mbgcnbd.PlotTrackingInc(params.mbgcnbd,
         T.cal = groceryCBS$T.cal,
         T.tot = max(groceryCBS$T.cal + groceryCBS$T.star),
         actual.inc.tracking = elog2inc(groceryElog))

## ------------------------------------------------------------------------
# mean absolute error (MAE)
mae <- function(act, est) {
  stopifnot(length(act)==length(est))
  sum(abs(act-est)) / sum(act)
}
mae.nbd <- mae(groceryCBS$x.star, groceryCBS$xstar.nbd)
mae.pnbd <- mae(groceryCBS$x.star, groceryCBS$xstar.pnbd)
mae.mbgcnbd <- mae(groceryCBS$x.star, groceryCBS$xstar.mbgcnbd)
rbind(`NBD`        = c(`MAE` = round(mae.nbd, 3)),
      `Pareto/NBD` = c(`MAE` = round(mae.pnbd, 3)),
      `MBG/CNBD-k` = c(`MAE` = round(mae.mbgcnbd, 3)))
lift <- 1 - mae.mbgcnbd / mae.pnbd
cat("Lift in MAE for MBG/CNBD-k vs. Pareto/NBD:", round(100*lift, 1), "%")

## ------------------------------------------------------------------------
# load grocery dataset, if it hasn't been done before
if (!exists("groceryCBS")) {
  data("groceryElog")
  groceryCBS <- elog2cbs(groceryElog, T.cal = "2006-12-31")
}
# generate parameter draws (~13secs on 2015 MacBook Pro)
pnbd.draws <- pnbd.mcmc.DrawParameters(groceryCBS)
# generate draws for holdout period
pnbd.xstar.draws <- mcmc.DrawFutureTransactions(groceryCBS, pnbd.draws)
# conditional expectations
groceryCBS$xstar.pnbd.hb   <- apply(pnbd.xstar.draws, 2, mean)
# P(active)
groceryCBS$pactive.pnbd.hb <- mcmc.PActive(pnbd.xstar.draws)
# P(alive)
groceryCBS$palive.pnbd.hb  <- mcmc.PAlive(pnbd.draws)
# show estimates for first few customers
head(groceryCBS[, c("x", "t.x", "x.star",
                    "xstar.pnbd.hb", "pactive.pnbd.hb",
                    "palive.pnbd.hb")])

## ------------------------------------------------------------------------
class(pnbd.draws$level_2)

# convert cohort-level draws from coda::mcmc.list to a matrix, with 
# each parameter becoming a column, and each draw a row
cohort.draws <- pnbd.draws$level_2
head(as.matrix(cohort.draws), 5)

# compute median across draws, and compare to ML estimates; as can be
# seen, the two parameter estimation approaches result in very similar
# estimates
round(
  rbind(`Pareto/NBD (HB)` = apply(as.matrix(cohort.draws), 2, median),
      `Pareto/NBD`      = BTYD::pnbd.EstimateParameters(groceryCBS))
, 2)

## ---- fig.show="hold", warning=FALSE, fig.width=7, fig.height=3, fig.cap="MCMC traces and parameter distributions of cohort-level parameters"----
# plot trace- and density-plots for heterogeneity parameters
op <- par(mfrow = c(2, 4), mar = c(2.5, 2.5, 2.5, 2.5))
coda::traceplot(pnbd.draws$level_2)
coda::densplot(pnbd.draws$level_2)
par(op)

## ---- fig.show="hold", warning=FALSE, fig.width=7, fig.height=3, fig.cap="MCMC traces and parameter distributions of individual-level parameters for a specific customer"----
class(pnbd.draws$level_1)
length(pnbd.draws$level_1)

customer4 <- "4"
customer4.draws <- pnbd.draws$level_1[[customer4]]
head(as.matrix(customer4.draws), 5)
round(apply(as.matrix(customer4.draws), 2, median), 3)

# plot trace- and density-plots for customer4 parameters
op <- par(mfrow = c(2, 4), mar = c(2.5, 2.5, 2.5, 2.5))
coda::traceplot(pnbd.draws$level_1[[customer4]])
coda::densplot(pnbd.draws$level_1[[customer4]])
par(op)

## ---- eval = FALSE-------------------------------------------------------
#  # runs for ~120secs on a MacBook Pro 2015
#  op <- par(mfrow = c(1, 2))
#  nil <- mcmc.PlotFrequencyInCalibration(pnbd.draws, groceryCBS)
#  nil <- mcmc.PlotTrackingInc(pnbd.draws,
#           T.cal = groceryCBS$T.cal,
#           T.tot = max(groceryCBS$T.cal + groceryCBS$T.star),
#           actual.inc.tracking.data = elog2inc(groceryElog))
#  par(op)

## ---- eval = FALSE-------------------------------------------------------
#  # load CDNow event log from BTYD package
#  cdnowElog <- read.csv(
#                 system.file("data/cdnowElog.csv", package = "BTYD"),
#                 stringsAsFactors = FALSE,
#                 col.names = c("cust", "sampleid", "date", "cds", "sales"))
#  cdnowElog$date <- as.Date(as.character(cdnowElog$date),
#                            format = "%Y%m%d")
#  # convert to CBS; split into 39 weeks calibration, and 39 weeks holdout
#  cdnowCbs <- elog2cbs(cdnowElog,
#                       T.cal = "1997-09-30", T.tot = "1998-06-30")
#  
#  # estimate Pareto/NBD (Abe) without covariates; model M1 in Abe (2009)
#  draws.m1 <- abe.mcmc.DrawParameters(cdnowCbs,
#                mcmc = 7500, burnin = 2500) # ~33secs on 2015 MacBook Pro
#  quant <- function(x) round(quantile(x, c(0.025, 0.5, 0.975)), 2)
#  t(apply(as.matrix(draws.m1$level_2), 2, quant))
#  #>                        2.5%   50% 97.5%
#  #> log_lambda            -3.70 -3.54 -3.32
#  #> log_mu                -3.96 -3.59 -3.26
#  #> var_log_lambda         1.10  1.34  1.65
#  #> cov_log_lambda_log_mu -0.20  0.13  0.74
#  #> var_log_mu             1.44  2.62  5.05
#  
#  #' append dollar amount of first purchase to use as covariate
#  first <- aggregate(sales ~ cust, cdnowElog, function(x) x[1] * 10^-3)
#  names(first) <- c("cust", "first.sales")
#  cdnowCbs <- merge(cdnowCbs, first, by = "cust")
#  
#  #' estimate with first purchase spend as covariate; model M2 in Abe (2009)
#  draws.m2 <- abe.mcmc.DrawParameters(cdnowCbs,
#                covariates = c("first.sales"),
#                mcmc = 7500, burnin = 2500) # ~33secs on 2015 MacBook Pro
#  t(apply(as.matrix(draws.m2$level_2), 2, quant))
#  #>                         2.5%   50% 97.5%
#  #> log_lambda_intercept   -4.02 -3.77 -3.19
#  #> log_mu_intercept       -4.37 -3.73 -2.69
#  #> log_lambda_first.sales  0.04  6.04  9.39
#  #> log_mu_first.sales     -9.02  1.73  7.90
#  #> var_log_lambda          0.01  1.35  1.79
#  #> cov_log_lambda_log_mu  -0.35  0.22  0.76
#  #> var_log_mu              0.55  2.59  4.97

## ---- eval=FALSE---------------------------------------------------------
#  # load grocery dataset, if it hasn't been done before
#  if (!exists("groceryCBS")) {
#    data("groceryElog")
#    groceryCBS <- elog2cbs(groceryElog, T.cal = "2006-12-31")
#  }
#  # estimte Pareto/GGG
#  pggg.draws <- pggg.mcmc.DrawParameters(groceryCBS) # ~2mins on 2015 MacBook Pro
#  # generate draws for holdout period
#  pggg.xstar.draws <- mcmc.DrawFutureTransactions(groceryCBS, pggg.draws)
#  # conditional expectations
#  groceryCBS$xstar.pggg  <- apply(pggg.xstar.draws, 2, mean)
#  # P(active)
#  groceryCBS$pactive.pggg <- mcmc.PActive(pggg.xstar.draws)
#  # P(alive)
#  groceryCBS$palive.pggg  <- mcmc.PAlive(pggg.draws)
#  # show estimates for first few customers
#  head(groceryCBS[, c("x", "t.x", "x.star",
#                      "xstar.pggg", "pactive.pggg", "palive.pggg")])
#  #>    x      t.x x.star xstar.pggg pactive.pggg palive.pggg
#  #> 1  0  0.00000      0       0.02         0.02        0.03
#  #> 2  1 50.28571      0       1.01         0.59        1.00
#  #> 3 19 48.57143     14      14.76         0.87        0.87
#  #> 4  0  0.00000      0       0.04         0.03        0.13
#  #> 5  2 40.42857      3       2.02         0.84        0.91
#  #> 6  5 47.57143      6       4.46         0.92        0.95
#  
#  # report median cohort-level parameter estimates
#  round(apply(as.matrix(pggg.draws$level_2), 2, median), 3)
#  #>     t gamma     r alpha     s  beta
#  #> 1.695 0.373 0.948 5.243 0.432 4.348
#  # report mean over median individual-level parameter estimates
#  median.est <- sapply(pggg.draws$level_1, function(draw) {
#    apply(as.matrix(draw), 2, median)
#  })
#  round(apply(median.est, 1, mean), 3)
#  #>    k lambda     mu    tau      z
#  #> 3.892  0.160  0.065 69.546  0.316

## ---- eval = FALSE-------------------------------------------------------
#  # compare predictions with actuals at aggregated level
#  rbind(`Actuals`    = c(`Holdout` = sum(groceryCBS$x.star)),
#        `Pareto/GGG` = round(sum(groceryCBS$xstar.pggg)),
#        `MBG/CNBD-k` = round(sum(groceryCBS$xstar.mbgcnbd)),
#        `Pareto/NBD (HB)` = round(sum(groceryCBS$xstar.pnbd.hb)))
#  #>                 Holdout
#  #> Actuals            3389
#  #> Pareto/GGG         3815
#  #> MBG/CNBD-k         3970
#  #> Pareto/NBD (HB)    4018
#  
#  # error on customer level
#  mae <- function(act, est) {
#    stopifnot(length(act)==length(est))
#    sum(abs(act-est)) / sum(act)
#  }
#  mae.pggg <- mae(groceryCBS$x.star, groceryCBS$xstar.pggg)
#  mae.mbgcnbd <- mae(groceryCBS$x.star, groceryCBS$xstar.mbgcnbd)
#  mae.pnbd.hb <- mae(groceryCBS$x.star, groceryCBS$xstar.pnbd.hb)
#  rbind(`Pareto/GGG`      = c(`MAE` = round(mae.pggg, 3)),
#        `MBG/CNBD-k`      = c(`MAE` = round(mae.mbgcnbd, 3)),
#        `Pareto/NBD (HB)` = c(`MAE` = round(mae.pnbd.hb, 3)))
#  #>                   MAE
#  #> Pareto/GGG      0.621
#  #> MBG/CNBD-k      0.644
#  #> Pareto/NBD (HB) 0.688
#  
#  lift <- 1 - mae.pggg / mae.pnbd.hb
#  cat("Lift in MAE:", round(100*lift, 1), "%")
#  #> Lift in MAE for Pareto/GGG vs. Pareto/NBD: 9.8%

