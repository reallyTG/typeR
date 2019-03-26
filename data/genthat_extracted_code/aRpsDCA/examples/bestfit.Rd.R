library(aRpsDCA)


### Name: bestfit
### Title: Best-fitting of Arps decline curves
### Aliases: bestfit best.exponential best.hyperbolic best.hyp2exp best.fit
###   best.exponential.from.Np best.hyperbolic.from.Np best.hyp2exp.from.Np
###   best.fit.from.Np best.exponential.from.interval
###   best.hyperbolic.from.interval best.hyp2exp.from.interval
###   best.fit.from.interval best.exponential.curtailed
###   best.hyperbolic.curtailed best.hyp2exp.curtailed best.curtailed.fit
###   best.exponential.curtailed.from.Np best.hyperbolic.curtailed.from.Np
###   best.hyp2exp.curtailed.from.Np best.curtailed.fit.from.Np
###   best.exponential.curtailed.from.interval
###   best.hyperbolic.curtailed.from.interval
###   best.hyp2exp.curtailed.from.interval best.curtailed.fit.from.interval
###   best.exponential.with.buildup best.hyperbolic.with.buildup
###   best.hyp2exp.with.buildup best.fit.with.buildup
###   best.exponential.from.Np.with.buildup
###   best.hyperbolic.from.Np.with.buildup
###   best.hyp2exp.from.Np.with.buildup best.fit.from.Np.with.buildup
###   best.exponential.from.interval.with.buildup
###   best.hyperbolic.from.interval.with.buildup
###   best.hyp2exp.from.interval.with.buildup
###   best.fit.from.interval.with.buildup

### ** Examples

fitme.hyp2exp.t <- seq(0, 5, 1 / 12) # 5 years
fitme.hyp2exp.q <- hyp2exp.q(
    1000, # Bbl/d
    as.nominal(0.70), # / year
    1.9,
    as.nominal(0.15), # / year
    fitme.hyp2exp.t
) * rnorm(n=length(fitme.hyp2exp.t), mean=1, sd=0.1) # perturb

hyp2exp.fit <- best.hyp2exp(fitme.hyp2exp.q, fitme.hyp2exp.t)
cat(paste("SSE:", hyp2exp.fit$sse))
dev.new()
plot(fitme.hyp2exp.q ~ fitme.hyp2exp.t, main="Hyperbolic-to-Exponential Fit",
     col="blue", log="y", xlab="Time", ylab="Rate")
lines(arps.q(hyp2exp.fit$decline, fitme.hyp2exp.t) ~ fitme.hyp2exp.t,
      col="red")
legend("topright", pch=c(1, NA), lty=c(NA, 1), col=c("blue", "red"), legend=c("Actual", "Fit"))



