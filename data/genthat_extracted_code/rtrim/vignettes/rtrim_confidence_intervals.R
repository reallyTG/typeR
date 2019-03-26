## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width  = 7,
  fig.height = 5
)

## ------------------------------------------------------------------------
rm(list=ls()) # Always start with a clean slate
library(rtrim)
red   <- "#E41A1C" # Set up some nice colors
blue  <- "#377EB8"
green <- "#4daf4a"
lgray <- gray(0.8)
mgray <- gray(0.5)
dgray <- gray(0.2)

## ------------------------------------------------------------------------
mu    <- 5.0                            # mean
sd    <- 2.0                            # standard deviation
alpha <- 0.05                           # i.e., 95% confidence interval

# Full normal distribution
x <- seq(mu-3*sd, mu+3*sd, len=100)
y <- dnorm(x, mean=mu, sd=sd)

# Use quantile function to compute the confidence interval (CI)
lo <- qnorm(alpha/2,   mean=mu, sd=sd)  # lower CI bound
hi <- qnorm(1-alpha/2, mean=mu, sd=sd)  # upper CI bound

# start with an empty plot
plot(NULL,NULL, type='n', xlim=range(x), ylim=range(y),
     xlab=NA, ylab="Probability density", las=1)

xci <- seq(lo, hi, len=100)             # background: confidence interval
yci <- dnorm(xci, mean=mu, sd=sd)
xx <- c(xci, rev(xci))
yy <- c(0*yci, rev(yci))
polygon(xx,yy,col=gray(0.9), border=NA)

lines(x,y, col=red, lwd=2)              # Foreground: complete distribution

# Annotation and decoration
lines(c(mu,mu), c(0,dnorm(mu,mean=mu,sd=sd)), lty="dashed", lwd=0.5) # mean
lines(c(mu-sd,mu-sd), c(0,dnorm(mu-sd,mean=mu,sd=sd)), lty="dashed", lwd=0.5) # mu - s.d.
lines(c(mu+sd,mu+sd), c(0,dnorm(mu+sd,mean=mu,sd=sd)), lty="dashed", lwd=0.5) # mu + s.d.
abline(h=0, lwd=0.5) # proper y=0 line
text(mean(x), mean(y), sprintf("%.0f%%", 100*(1-alpha)))
yarr <- 0.02                            # y-position of arrow
arrows(mu-sd,yarr, mu,yarr, code=3,length=0.12)
text(mu-sd/2, yarr, "s.d.", pos=3)
mul <- (hi-mu) / sd                     # sd -> CI multiplier
arrows(mu,yarr, hi,yarr, code=3, length=0.12)
text(mean(c(mu,hi)), yarr, sprintf("%.2f * s.d.", mul), pos=3)

## ------------------------------------------------------------------------
mu <- 0                                 # Standard normal distribution
sd <- 1.0
alpha <- 0.05                           # 95% confidence interval
xcdf <- seq(mu-3*sd, mu+3*sd, len=100)  # cumulative distribution function
ycdf <- pnorm(xcdf, mean=mu, sd=sd)
plot(NULL,NULL, xlim=range(xcdf), ylim=c(0,1),
     xlab="Value", ylab="Cumulative distribution function", las=1)
# connect mu with median
x0 <- min(xcdf)
x0 <- -2.8
pp <- c(alpha/2, 0.5, 1-alpha/2)
for (i in 1:length(pp)) {
  p <- pp[i]
  x <- qnorm(p, mean=mu, sd=sd)
  y0 <- ifelse(i==3, 0.04, 0)
  lines(c(x0, x,x), c(p,p,y0), col=mgray)
  text(-3,p,sprintf("%.3f", p), cex=0.8, col=mgray)
  if (i==3) text(x,0, sprintf("%.2f", x), cex=0.8, col=mgray)
  xmid <- (x0+x)/2
  arrows(xmid,p,xmid+0.01,p, col=mgray, length=0.1)
  if (p<0.1) next # skip vertical arrows if there is no place
  arrows(x,p/2,x,p/2-0.01, col=mgray, length=0.1)
}
# Foreground: CDF
lines(xcdf,ycdf, col=red, lwd=2)

## ------------------------------------------------------------------------
lambda <- 5L # Expected value
x <- 0 : (lambda*3)
y <- ppois(x, lambda)
plot(x, y, type='n', xlab="Value", ylab="Cumulative distribution function", las=1) # empty
# background: indicate expected value
abline(v=lambda, col=mgray, lty="dashed")
text(lambda, 0.1, expression(lambda), col=mgray, pos=4)
# foreground on top
lines(x, y, type='s', col=red)
points(x,y, pch=16, col=red)

## ------------------------------------------------------------------------
lambda <- 5L # Expected value
x <- 0 : (lambda*3)
y <- ppois(x, lambda)
plot(x, y, type='n', xlab="Value", ylab="Cumulative distribution function", las=1)
# background: indicate discrete cdf->quantile
cdf_to_quantile <- function(p, ...) {
  q <- qpois(p, ...)
  xx <- c(0,q,q)
  yy <- c(p,p,0)
  lines(xx,yy, col=mgray)
  arrows(q/2,p,q/2+0.01,p, length=0.1, col=mgray) # add arrow
  arrows(q,p/2,q,p/2-0.01, length=0.1, col=mgray)
}
cdf_to_quantile(0.74, lambda=lambda)
cdf_to_quantile(0.78, lambda=lambda)
# cdf on top
lines(x, y, type='s', col=red)
points(x,y, pch=16, col=red)

## ------------------------------------------------------------------------
# Plot Poisson distribution (expected value: 10)
lambda <- 10L # define expected value
xp <- 0 : (lambda * 3L)
yp <- ppois(xp, lambda=lambda)
plot(xp, yp, type='s', pch=16, col=red,
     xlab="Value", ylab="Cumulative distribution function", las=1)
points(xp,yp, pch=16, col=red)

# Plot equivalent gamma
xg <- xp # same range
yg <- pgamma(xg, shape=lambda, scale=1)
lines(xg, yg, col=blue, lwd=2)

abline(v=lambda, lty="dashed", col=mgray) # mark expected value
text(lambda, 0.2, expression(lambda), pos=4, col=mgray)
legend(0,1, legend=c("Poisson","Gamma"), col=c(red,blue), lty="solid", lwd=2)

## ------------------------------------------------------------------------
lambda <- 50L # define expected value
xp <- 0 : (lambda * 3L)
yp <- ppois(xp, lambda=lambda)
plot(xp, yp, type='s', pch=16, col=red,
     xlab="Value", ylab="Cumulative distribution function", las=1)
points(xp,yp, pch=16, col=red)
# Plot equivalent gamma
xg <- xp # same range
yg <- pgamma(xg, shape=lambda, scale=1)
lines(xg, yg, col=blue, lwd=2)
abline(v=lambda, lty="dashed", col=mgray) # mark expected value
text(lambda, 0.2, expression(lambda), pos=4, col=mgray)
legend(0,1, legend=c("Poisson","Gamma"), col=c(red,blue), lty="solid", lwd=2)

## ------------------------------------------------------------------------
lambda <- exp(seq(log(2.0), log(1000.0), len=100)) # uniform spacing in log-space
alpha <- 0.05 # 95% CI

qhi <- qgamma(p=1-alpha/2, shape=lambda)
qlo <- qgamma(p=alpha/2, shape=lambda)
sd <- sqrt(lambda)
umul <- (qhi-lambda) / sd
lmul <- (lambda-qlo) / sd
plot(NULL, NULL, xlim=range(lambda), ylim=range(range(umul),range(lmul)), log="x",
     xlab="Expected value", ylab="Multiplier", las=1)
lines(lambda, umul, col=red, lwd=2)
lines(lambda, lmul, col=red, lwd=2)
m0 <- qnorm(0.975) # multiplier for normal distributions
abline(h=m0, col=mgray, lty="dashed", lwd=1)
text(2.5, m0, sprintf("%.2f",m0), col=mgray, pos=1)
idx <- which(lambda>=10)[1]
text(lambda[idx],umul[idx],"M_hi", pos=3, col=red)
text(lambda[idx],lmul[idx],"M_lo", pos=1, col=red)

## ------------------------------------------------------------------------
library(rtrim)
# Run basic TRIM model without overdispersion
data(skylark2)
m <- trim(count ~ site + year, data=skylark2, model=3, overdisp=FALSE)
tt <- totals(m)

alpha <- 0.05 # define confidence interval: 95%
lambda <- tt$imputed # use imputed time totals as expected value

qlo <- qgamma(p=alpha/2,  shape=lambda) # Compute multipliers
qhi <- qgamma(p=1-alpha/2, shape=lambda)
lmul <- (lambda-qlo) / sqrt(lambda)
umul <- (qhi-lambda) / sqrt(lambda)
tt$lo <- tt$imputed - tt$se_imp * lmul # Compute CI bounds
tt$hi <- tt$imputed + tt$se_imp * umul

plot(tt)
lines(tt$time, tt$lo, lty="dashed", col=red)
lines(tt$time, tt$hi, lty="dashed", col=red)

## ------------------------------------------------------------------------
tt <- totals(m, level=0.95)
plot(tt)

## ------------------------------------------------------------------------
plot(tt, band="ci")

## ------------------------------------------------------------------------
mu <- 100L
sig2 <- c(1, 2, 5, 10)
n <- length(sig2)
colors <- c("#E41A1C","#377EB8","#4DAF4A","#984EA3") # ColorBrewer "Set1" colors 1..4
x <- seq.int(0, 2*mu, by=2)
plot(NULL, NULL, type="n", xlim=range(x), ylim=c(0,1),
     xlab="Value", ylab="Cumulative distribution function", las=1)
for (i in 1:n) {
  y <- if (sig2[i]==1) ppois(x, mu)
       else            pnbinom(x, mu=mu, size=mu/(sig2[i]-1))
  points(x, y, col=colors[i], pch=16, cex=0.5)
}
# mark expected value
abline(v=mu, col=mgray, lty="dashed")
text(mu, 0.1, expression(lambda), pos=4, col=mgray)
# add legend
leg_msg <- sprintf("Overdispersion = %d", sig2)
leg_msg[1] <- "Poisson"
legend("topleft", legend=leg_msg, col=colors[1:n], pch=16)

## ------------------------------------------------------------------------
plot(NULL, NULL, type="n", xlim=range(x), ylim=c(0,1),
     xlab="", ylab="Cumulative distribution function", las=1)
# Plot discrete distributions: Poisson or Negative Binonmial
for (i in 1:n) {
  y <- if (sig2[i]==1) ppois(x, mu)
       else            pnbinom(x, mu=mu, size=mu/(sig2[i]-1))
  points(x, y, col=colors[i], pch=16, cex=0.5)
}
# Plot continuous distributions: Gamma
for (i in 1:n) {
  y <- pgamma(x, shape=mu/sig2[i], scale=sig2[i])
  lines(x, y, col=colors[i])
}
# mark expected value
abline(v=mu, col=mgray, lty="dashed")
text(mu, 0.1, expression(lambda), pos=4)
# add legend
leg_msg <- sprintf("Overdispersion = %d", sig2)
leg_msg[1] <- "Poisson"
legend("topleft", legend=leg_msg, col=colors[1:n], pch=16)

## ------------------------------------------------------------------------
lambda <- exp(seq(log(2.0), log(1000.0), len=100)) # uniform spacing in log-space
alpha <- 0.05 # 95% CI
sig2  <- c(1, 2, 5, 10)
n <- length(sig2)
colors <- c("#E41A1C","#377EB8","#4DAF4A","#984EA3") # ColorBrewer "Set1" colors 1..4

plot(NULL, NULL, xlim=range(lambda), ylim=c(0,3), log="x",
     xlab="Expected value", ylab="Multiplier", las=1)

for (i in 1:n) {
  qhi <- qgamma(p=1-alpha/2, shape=lambda/sig2[i], scale=sig2[i])
  qlo <- qgamma(p=alpha/2,   shape=lambda/sig2[i], scale=sig2[i])
  sd <- sqrt(sig2[i] * lambda)
  umul <- (qhi-lambda) / sd
  lmul <- (lambda-qlo) / sd
  lines(lambda, umul, col=colors[i], lwd=2)
  lines(lambda, lmul, col=colors[i], lwd=2)
  # idx <- which(lambda>=10)[1]
  # text(lambda[idx],umul[idx],"M_hi", pos=3, col=red)
  # text(lambda[idx],lmul[idx],"M_lo", pos=1, col=red)\
}
m0 <- qnorm(0.975) # Multiplier for normal distibutions, i.e. 1.96
abline(h=m0, col=mgray, lty="dashed", lwd=2)
text(2.5,m0,sprintf("%.2f",m0), col=mgray, pos=1)
leg_msg <- sprintf("Overdispersion = %d", sig2)
leg_msg[1] <- "Poisson"
legend("bottomright", legend=leg_msg, col=colors[1:n], pch=16)

## ------------------------------------------------------------------------
lambda <- 20
sig2   <- 8
alpha <- 0.05 # 95% CI
n <- length(sig2)

# Discrete: Poisson & Neg. Binomial
x <- 0 : (3*lambda)
y <- dnbinom(x, mu=lambda, size=lambda/(sig2-1))
plot(x,y, xlab="Value", ylab="Frequency", type='s', col=red, las=1)
points(x, y, col=red, pch=16, cex=0.5)

# Expected value as solid vertical line
abline(v=lambda, col=mgray, lwd=2)
# Standard errors as dashed lines
sd <- sqrt(sig2 * lambda)
abline(v=c(lambda-sd,lambda+sd), lty="dashed", col=blue, lwd=2)
# plot CI intervals as dotted lines
lo <- qgamma(p=  alpha/2, shape=lambda/sig2, scale=sig2)
hi <- qgamma(p=1-alpha/2, shape=lambda/sig2, scale=sig2)
abline(v=c(lo,hi), lty="dotted", col=green, lwd=2)
legend("topright", c("mean","std.err","C.I."), lty=c("solid","dashed","dotted"),
       lwd=2, col=c(mgray,blue,green))

## ------------------------------------------------------------------------
lambda <- 10
sig2   <- 12
alpha <- 0.05 # 95% CI
n <- length(sig2)

# Discrete: Poisson & Neg. Binomial
x <- 0 : (3*lambda)
y <- dnbinom(x, mu=lambda, size=lambda/(sig2-1))
plot(x,y, xlab="Value", ylab="Frequency", type='s', col=red, las=1)
points(x, y, col=red, pch=16, cex=0.5)

# Expected value as solid vertical line
abline(v=lambda, col=mgray, lwd=2)
# Standard errors as dashed lines
sd <- sqrt(sig2 * lambda)
abline(v=c(lambda-sd,lambda+sd), lty="dashed", col=blue, lwd=2)
# plot CI intervals as dotted lines
lo <- qgamma(p=  alpha/2, shape=lambda/sig2, scale=sig2)
hi <- qgamma(p=1-alpha/2, shape=lambda/sig2, scale=sig2)
abline(v=c(lo,hi), lty="dotted", col=green, lwd=2)
legend("topright", c("mean","std.err","C.I."), lty=c("solid","dashed","dotted"),
       lwd=2, col=c(mgray,blue,green))

## ------------------------------------------------------------------------
lambda <- exp(seq(log(2.0), log(1000.0), len=100)) # uniform spacing in log-space
alpha <- 0.05 # 95% CI
sig2  <- c(1, 3, 10, 30, 100)
n <- length(sig2)
colors <- c("#E41A1C","#377EB8","#4DAF4A","#984EA3","#FF7F00") # ColorBrewer "Set1" colors 1..5

plot(NULL, NULL, xlim=range(lambda), ylim=c(0,3), log="x",
     xlab="Expected value", ylab="Multiplier")

for (i in 1:n) {
  qhi <- qgamma(p=1-alpha/2, shape=lambda/sig2[i], scale=sig2[i])
  qlo <- qgamma(p=alpha/2,   shape=lambda/sig2[i], scale=sig2[i])
  sd <- sqrt(sig2[i] * lambda)
  umul <- (qhi-lambda) / sd
  lmul <- (lambda-qlo) / sd
  lines(lambda, umul, col=colors[i], lwd=1, lty="dashed")
  lines(lambda, lmul, col=colors[i], lwd=1, lty="dashed")
  # plot feasible range
  ok <- lambda > sig2[i]
  lines(lambda[ok], umul[ok], col=colors[i], lwd=2)
  lines(lambda[ok], lmul[ok], col=colors[i], lwd=2)
}
abline(h=qnorm(0.975), col=mgray, lty="dashed", lwd=2)
leg_msg <- sprintf("Overdispersion = %d", sig2)
leg_msg[1] <- "Poisson"
legend("bottomright", legend=leg_msg, col=colors[1:n], lty="solid")

## ------------------------------------------------------------------------
# Run TRIM with overdispersion
m1 <- trim(count ~ site + year, data=skylark2, model=3, overdisp=TRUE)
tt1 <- totals(m1, level=0.95)
plot(tt1, main=sprintf("Skylark; overdispersion=%.2f", overdispersion(m1)))

## ------------------------------------------------------------------------
idx <- index(m1, level=0.95)
plot(idx, pct=TRUE)

