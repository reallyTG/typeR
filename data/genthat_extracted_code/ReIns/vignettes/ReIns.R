## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------
library("ReIns")

data("norwegianfire")

# Claim year
year <- norwegianfire$year + 1900

# Claim size
size <- norwegianfire$size

# Plot Norwegian fire insurance data per year
plot(year, size, xlab="Year", ylab="Size")

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Exponential QQ-plot
ExpQQ(size)


# Mean excess plot with X_{n-k,n}
MeanExcess(size)

# Mean excess plot with k
MeanExcess(size, k=TRUE)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Pareto QQ-plot
ParetoQQ(size)


# Derivative plot with log X_{n-k,n}
ParetoQQ_der(size)

# Derivative plot with k
ParetoQQ_der(size, k=TRUE)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Log-normal QQ-plot
LognormalQQ(size)


# Derivative plot with log X_{n-k,n}
LognormalQQ_der(size)

# Derivative plot with k
LognormalQQ_der(size, k=TRUE)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Weibull QQ-plot
WeibullQQ(size)


# Derivative plot with log X_{n-k,n}
WeibullQQ_der(size)

# Derivative plot with k
WeibullQQ_der(size, k=TRUE)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Hill plot
H <- Hill(size, plot=TRUE, col="blue")

# Add EPD estimator
EPD(size, add=TRUE, col="orange", lty=2)

legend("bottomright", c("Hill","EPD"), col=c("blue","orange"), lty=1:2)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Generalised QQ-plot
genQQ(size, gamma=H$gamma)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Generalised Hill estimator
GH <- genHill(size, gamma=H$gamma, plot=TRUE, col="blue", ylim=c(0.5,0.8))

# Moment estimator
M <- Moment(size, add=TRUE, lty=2)

legend("bottomright", c("genHill","Moment"), col=c("blue","black"), lty=1:2)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

p <- 0.005

# Estimates for 99.5% VaR
Quant(size, gamma=H$gamma, p=p, plot=TRUE, col="blue", ylim=c(0,10^5))



# Estimates for 99.5% VaR
QuantGH(size, gamma=GH$gamma, p=p, plot=TRUE, col="blue", ylim=c(0,10^5))

QuantMOM(size, gamma=M$gamma, p=p, add=TRUE, lty=2)

legend("topright", c("genHill","Moment"), col=c("blue","black"), lty=1:2)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

q <- 10^5

# Estimates for return period
Return(size, gamma=H$gamma, q=q, plot=TRUE, col="blue", ylim=c(0,1200))



# Estimates for return period
ReturnGH(size, gamma=GH$gamma, q=q, plot=TRUE, col="blue", ylim=c(0,1200))

ReturnMOM(size, gamma=M$gamma, q=q, add=TRUE, lty=2)

legend("bottomright", c("genHill","Moment"), col=c("blue","black"), lty=1:2)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------
# Set seed
set.seed(29072016)

# Pareto random sample
X <- rpareto(500, shape=2)

# Censoring variable
Y  <- rpareto(500, shape=1)

# Observed sample
Z <- pmin(X, Y)

# Censoring indicator
censored <- (X>Y)

# Hill estimates adapted for right censoring
cHill(Z, censored, plot=TRUE)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------
# Set seed
set.seed(29072016)

# Pareto random sample
X <- rpareto(500, shape=2)

# Censoring variable
Y  <- rpareto(500, shape=1)

# Observed sample
Z <- pmin(X, Y)

# Censoring indicator
censored <- (X>Y)

# Right boundary
U <- Z
U[censored] <- Inf

# Mean excess plot
MeanExcess_TB(Z, U, censored, k=FALSE)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------
# Mean excess plot
MeanExcess(size)

# Add vertical line at 50% and 99.6% quantiles of the data
abline(v=quantile(size, c(0.5,0.996)), lty=2)

## ---- eval=FALSE---------------------------------------------------------
#  
#  # Splicing of Mixed Erlang (ME) and 2 Pareto pieces
#  # Use 3 as initial value for M
#  spliceFit <- SpliceFitPareto(size, const=c(0.5,0.996), M=3)

## ------------------------------------------------------------------------
# Create MEfit object
mefit <- MEfit(p=1, shape=17, theta=44.28, M=1)

# Create EVTfit object
evtfit <- EVTfit(gamma=c(0.80,0.66), endpoint=c(37930,Inf))

# Create SpliceFit object
splicefit <- SpliceFit(const=c(0.5,0.996), trunclower=0, t=c(1020,37930), type=c("ME","TPa","Pa"),
                       MEfit=mefit, EVTfit=evtfit)

# Show summary
summary(splicefit)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------
# Points to look at
x <- seq(0, 1*10^5, 10^2)

# Plot of fitted survival function and empirical survival function
SpliceECDF(x, size, splicefit, ylim=c(0,0.1))

# PP-plot with fitted survival function and empirical survival function 
SplicePP(size, splicefit)

# PP-plot with log-scales
SplicePP(size, splicefit, log=TRUE)

# QQ-plot with fitted quantile function
SpliceQQ(size, splicefit)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------
# Sequence of retentions
R <- seq(0, 10^6, 10^2)

# Premiums
e <- ExcessSplice(R, splicefit=splicefit)

# Compute premiums of excess-loss insurance min{(X-M)+,L}
e2 <- ExcessSplice(R, L=2*R, splicefit=splicefit)


# Plot premiums
plot(R, e, type="l", xlab="R", ylab=expression(Pi(R)-Pi(R+L)), ylim=c(0,10^3))
lines(R, e2, lty=2)
legend("topright", c(expression("L"==infinity),expression("L"==2*"R")), lty=1:2, lwd=2)

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Take small values for p
p <- seq(0, 0.01, 0.0001)

# VaR
VaR <- VaR(p, splicefit)

# Plot VaR
plot(p, VaR, xlab="p", ylab=expression(VaR[1-p]), type="l")

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------
# Small values for p
p <- seq(0.0001, 0.01, 0.0001)

# CTE
cte <- CTE(p, splicefit)

# Plot CTE
plot(p, cte, xlab="p", ylab=expression(CTE[1-p]), type="l")

## ---- fig.width=5, fig.height=3.5, fig.align='center'--------------------

# Simulate sample of size 1000
X <- rSplice(1000, splicefit)

# Plot simulated sample
plot(X, xlab="Index", ylab="Simulated losses")

## ---- fig.width=8.27, fig.height=5.83, fig.align='center', warning=FALSE----

# Chi-squared sample
X <- rchisq(1000, 2)

x <- seq(0,10,0.01)

# Classical approximations
p1 <- pClas(x, mean(X), var(X))
p2 <- pClas(x, mean(X), var(X), mean((X-mean(X))^3)/sd(X)^3, method="normal-power")
p3 <- pClas(x, mean(X), var(X), mean((X-mean(X))^3)/sd(X)^3, method="shifted Gamma")
p4 <- pClas(x, mean(X), var(X), mean((X-mean(X))^3)/sd(X)^3, method="shifted Gamma normal")

# True probabilities
p <- pchisq(x, 2)


# Plot true and estimated probabilities
plot(x, p, type="l", ylab="F(x)", ylim=c(0,1), col="red")
lines(x, p1, lty=2)
lines(x, p2, lty=3, col="green")
lines(x, p3, lty=4)
lines(x, p4, lty=5, col="blue")

legend("bottomright", c("True CDF", "normal approximation", "normal-power approximation",
                        "shifted Gamma approximation", "shifted Gamma normal approximation"), 
      lty=1:5, col=c("red", "black", "green", "black", "blue"), lwd=2)


## ---- fig.width=8.27, fig.height=5.83, fig.align='center', warning=FALSE----
x <- seq(0, 10, 0.01)

# Empirical moments
moments = c(mean(X), mean(X^2), mean(X^3), mean(X^4))

# Gram-Charlier approximation
p1 <- pGC(x, moments)

# Edgeworth approximation
p2 <- pEdge(x, moments)

# Normal approximation
p3 <- pClas(x, mean(X), var(X))

# True probabilities
p <- pchisq(x, 2)


# Plot true and estimated probabilities
plot(x, p, type="l", ylab="F(x)", ylim=c(0,1), col="red")
lines(x, p1, lty=2)
lines(x, p2, lty=3)
lines(x, p3, lty=4, col="blue")

legend("bottomright", c("True CDF", "GC approximation", 
                        "Edgeworth approximation", "Normal approximation"), 
       col=c("red", "black", "black", "blue"), lty=1:4, lwd=2)

