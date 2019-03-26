library(dynamichazard)


### Name: plot.ddsurvcurve
### Title: Create and plot survival curves
### Aliases: plot.ddsurvcurve lines.ddsurvcurve ddsurvcurve

### ** Examples

#####
# example with continuous time model
# setup data set. See `vignette("timedep", "survival")`
library(dynamichazard)
temp <- subset(pbc, id <= 312, select=c(id:sex, stage))
pbc2 <- tmerge(temp, temp, id=id, death = event(time, status))
pbc2 <- tmerge(pbc2, pbcseq, id = id, bili = tdc(day, bili))

# fit model
f1 <- ddhazard(
  Surv(tstart, tstop, death == 2) ~ ddFixed(log(bili)), pbc2, id = pbc2$id,
  max_T = 3600, Q_0 = 1, Q = 1e-2, by = 100, model = "exponential",
  control = ddhazard_control(method = "EKF", eps = 1e-4, n_max = 1000,
                             fixed_terms_method = "M_step"))

# predict with default which is all covariates set to zero
ddcurve <- ddsurvcurve(f1)
par(mar = c(4.5, 4, .5, .5))
plot(ddcurve, col = "DarkBlue", lwd = 2)

# compare with cox model
f2 <- coxph(Surv(tstart, tstop, death == 2) ~ log(bili), data = pbc2)
nw <- data.frame(bili = 1, tstart = 0, tstop = 3000)
lines(survfit(f2, newdata = nw))

# same as above but with bili = 3
nw <- data.frame(bili = 3)
lines(ddsurvcurve(f1, new_data = nw), col = "DarkBlue")
lines(survfit(f2, newdata = nw))

# change to time-varying slope
f3 <- ddhazard(
  Surv(tstart, tstop, death == 2) ~ log(bili), pbc2, id = pbc2$id,
  max_T = 3600, Q_0 = diag(1, 2), Q = diag(1e-2, 2), by = 100, model = "exponential",
  control = ddhazard_control(method = "EKF", eps = 1e-4, n_max = 1000))

# example with time-varying coefficient
nw <- data.frame(
  bili = c(2.1, 1.9, 3.3, 3.9, 3.8, 3.6, 4, 4.9, 4.2, 5.7, 10.2),
  tstart = c(0L, 225L, 407L, 750L, 1122L, 1479L, 1849L, 2193L, 2564L, 2913L,
             3284L),
  tstop = c(225L, 407L, 750L, 1122L, 1479L, 1849L, 2193L, 2564L, 2913L,
            3284L, 3600L))
ddcurve <- ddsurvcurve(f3, new_data = nw, tstart = "tstart", tstop = "tstop")
lines(ddcurve, "darkorange", lwd = 2)

# can condition on survival up to some time
ddcurve <- ddsurvcurve(f3, new_data = nw[-(1:5), ], tstart = "tstart",
                       tstop = "tstop")
lines(ddcurve, lty = 2, lwd = 2)

#####
# example with discrete time model
# head-and-neck cancer study data. See Efron, B. (1988) doi:10.2307/2288857
is_censored <- c(
  6, 27, 34, 36, 42, 46, 48:51, 51 + c(15, 30:28, 33, 35:37, 39, 40, 42:45))
head_neck_cancer <- data.frame(
  id = 1:96,
  stop = c(
    1, 2, 2, rep(3, 6), 4, 4, rep(5, 8),
    rep(6, 7), 7, 8, 8, 8, 9, 9, 10, 10, 10, 11, 14, 14, 14, 15, 18, 18, 20,
    20, 37, 37, 38, 41, 45, 47, 47,
    2, 2, 3, rep(4, 4), rep(5, 5), rep(6, 5),
    7, 7, 7, 9, 10, 11, 12, 15, 16, 18, 18, 18, 21,
    21, 24, 25, 27, 36, 41, 44, 52, 54, 59, 59, 63, 67, 71, 76),
  event = !(1:96 %in% is_censored),
  group = factor(c(rep(1, 45 + 6), rep(2, 45))))

# fit model
h1 <- ddhazard(
  Surv(stop, event) ~ group, head_neck_cancer, by = 1, max_T = 45,
  Q_0 = diag(2^2, 2), Q = diag(.01^2, 2), control = ddhazard_control(
    method = "GMA", eps = 1e-4, n_max = 200))

# plot predicted survival curve. Notice the steps since the model is discrete
nw <- data.frame(group = factor(1, levels = 1:2), tstart = 0, tstop = 30)
ddcurve <- ddsurvcurve(h1, new_data = nw, tstart = "tstart",
                       tstop = "tstop")
plot(ddcurve, col = "Darkblue")

nw$group <- factor(2, levels = 1:2)
ddcurve <- ddsurvcurve(h1, new_data = nw, tstart = "tstart",
                       tstop = "tstop")
lines(ddcurve, col = "DarkOrange")

# compare with KM
lines(survfit(Surv(stop, event) ~ 1, head_neck_cancer, subset = group == 1),
      col = "DarkBlue")
lines(survfit(Surv(stop, event) ~ 1, head_neck_cancer, subset = group == 2),
      col = "DarkOrange")




