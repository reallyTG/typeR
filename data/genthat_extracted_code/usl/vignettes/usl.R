## ----echo=FALSE-------------------------------------------------------------
library(knitr)

options(prompt="R> ", scipen=4, digits=4, width=78)
options(str=strOptions(strict.width='cut'), show.signif.stars=TRUE)

opts_knit$set(progress=FALSE, verbose=FALSE)

knit_hooks$set(small.mar=function(before, options, envir) {
if (before && options$fig.show != 'none')
  par(mar=c(4.1, 4.1, 1.1, 2.1))
})

opts_chunk$set(prompt=TRUE, comment=NA, tidy=FALSE, warning=FALSE)
opts_chunk$set(size='footnotesize', out.width='0.97\\textwidth')
opts_chunk$set(fig.width=7, fig.height=3.6, fig.align='center')
opts_chunk$set(fig.path='usl-', small.mar=TRUE)


## ---------------------------------------------------------------------------
library(usl)
data(raytracer)
raytracer

## ----'rtplot1', fig.show='hide'---------------------------------------------
plot(throughput ~ processors, data = raytracer)

## ----'rtplot2', echo=FALSE, fig.cap='Measured throughput of a raytracing software in relation to the number of available processors'----
plot(throughput ~ processors, data = raytracer)

## ---------------------------------------------------------------------------
usl.model <- usl(throughput ~ processors, data = raytracer)

## ---------------------------------------------------------------------------
summary(usl.model)

## ---------------------------------------------------------------------------
efficiency(usl.model)

## ----'rtbarplot', fig.cap='Rate of efficiency per processor for different numbers of processors running the raytracing software'----
barplot(efficiency(usl.model), ylab = "efficiency / processor", xlab = "processors")

## ---------------------------------------------------------------------------
coef(usl.model)

## ---------------------------------------------------------------------------
confint(usl.model, level = 0.95)

## ----'rtplot3', fig.cap='Throughput of a raytracing software using different numbers of processors'----
plot(throughput ~ processors, data = raytracer, pch = 16)
plot(usl.model, add = TRUE)

## ---------------------------------------------------------------------------
predict(usl.model, data.frame(processors = c(96, 128)))

## ---------------------------------------------------------------------------
peak.scalability(usl.model)

## ---------------------------------------------------------------------------
library(usl)
data(specsdm91)
specsdm91

## ---------------------------------------------------------------------------
usl.model <- usl(throughput ~ load, specsdm91, method = "nlxb")

## ---------------------------------------------------------------------------
summary(usl.model)

## ---------------------------------------------------------------------------
peak.scalability(usl.model)
peak.scalability(usl.model, kappa = 0.00005)

## ----'spplot1', fig.show='hide'---------------------------------------------
plot(specsdm91, pch = 16, ylim = c(0,2500))
plot(usl.model, add = TRUE)
cache.scale <- scalability(usl.model, kappa = 0.00005)
curve(cache.scale, lty = 2, add = TRUE)

## ----'spplot2', echo=FALSE, fig.cap='The result of the SPEC SDM91 benchmark for a SPARCcenter 2000 (dots) together with the calculated scalability function (solid line) and a hypothetical scalability function (dashed line)'----
plot(specsdm91, pch = 16, ylim = c(0,2500))
plot(usl.model, add = TRUE)
cache.scale <- scalability(usl.model, kappa = 0.00005)
curve(cache.scale, lty = 2, add = TRUE)

## ---------------------------------------------------------------------------
scalability(usl.model)(peak.scalability(usl.model))
scf <- scalability(usl.model, kappa = 0.00005)
scf(peak.scalability(usl.model, kappa = 0.00005))

## ---------------------------------------------------------------------------
load <- with(specsdm91, expand.grid(load = seq(min(load), max(load))))

## ---------------------------------------------------------------------------
fit <- predict(usl.model, newdata = load, interval = "confidence", level = 0.95)

## ---------------------------------------------------------------------------
usl.polygon <- matrix(c(load[, 1], rev(load[, 1]), fit[, 'lwr'], rev(fit[, 'upr'])),
                       nrow = 2 * nrow(load))

## ----'ciplot1', fig.cap='The result of the SPEC SDM91 benchmark with confidence bands for the scalability function at the 95\\% level'----
# Create empty plot (define canvas size, axis, ...)
plot(specsdm91, xlab = names(specsdm91)[1], ylab = names(specsdm91)[2],
      ylim = c(0, 2000), type = "n")

# Plot gray polygon indicating the confidence interval
polygon(usl.polygon, border = NA, col = "gray")

# Plot the measured throughput
points(specsdm91, pch = 16)

# Plot the fit
lines(load[, 1], fit[, 'fit'])

## ---------------------------------------------------------------------------
load <- data.frame(load = c(10, 20, 100, 200))
ovhd <- overhead(usl.model, newdata = load)
ovhd

## ----'ovplot1', fig.cap='Decomposition of the execution time for parallelized workloads of the SPECSDM91 benchmark. The time is measured as a fraction of the time needed for serial execution of the workload.'----
barplot(height = t(ovhd), names.arg = load[, 1], xlab = names(load), legend.text = TRUE)

## ---------------------------------------------------------------------------
data(oracledb)
head(subset(oracledb, select = c(timestamp, db_time, txn_rate)))

## ----'oraplot1', echo=FALSE, fig.cap='Transaction rates of an Oracle database system during the day of January 19th, 2012'----
plot(txn_rate ~ timestamp, oracledb, pch = 20, xlab = "Time of day", ylab = "Txn / sec")

## ----'orausl1', fig.cap='Relationship between the transaction rate and the number of average active sessions in an Oracle database system'----
usl.oracle <- usl(txn_rate ~ db_time, oracledb, method = "nlxb")

plot(txn_rate ~ db_time, oracledb, xlab = "Average active sessions", ylab = "Txn / sec")
plot(usl.oracle, add = TRUE)

## ---------------------------------------------------------------------------
coef(usl.oracle)

## ---------------------------------------------------------------------------
peak.scalability(usl.oracle)

## ---------------------------------------------------------------------------
confint(usl.oracle)

