library(RobPer)


### Name: FastTau
### Title: Tau-Regression using the Fast-tau-Algorithm
### Aliases: FastTau

### ** Examples

set.seed(22)
# Generate a disturbed light curve
lightcurve <- tsgen(ttype="unif",ytype="sine" , pf=7, redpart=0.1, interval=TRUE,
    npoints=100, ncycles=10, ps=7, SNR=4, alpha=0)
tt <- lightcurve[,1]
y  <- lightcurve[,2]
s  <- rep(1,100)  # unweighted regression

plot(tt, y, type="l", main="Fitting a sine to a disturbed lightcurve")

# Fit the true model (a sine of period 7)... designmatrix:
X <- Xgen(tt, n=100, s, pp=7, design="sine")
# Robust tau-fit:
beta_FastTau <- FastTau(X, y)$beta
# Robust S-fit:
beta_FastS <- FastS(X, y)$beta
# Least squares fit:
beta_lm <- lm(y~0+X)$coeff

# Plot:
sin7_fun <- function(t, beta) beta[1]+ beta[2]*sin(t*2*pi/7)+ beta[3]*cos(t*2*pi/7)
sin_FastTau <- function(t) sin7_fun(t, beta_FastTau)
sin_FastS <- function(t) sin7_fun(t, beta_FastS)
sin_lm <- function(t) sin7_fun(t, beta_lm)
curve(sin_FastTau, col="green", add=TRUE)
curve(sin_FastS, col="blue", add=TRUE, lty=2)
curve(sin_lm, col="red", add=TRUE)

legend("topleft", fill=c("black", "red", "green", "blue"),
    legend=c("Light Curve (disturbed)", "Least Squares Fit", "FastTau Fit", "FastS Fit"))



