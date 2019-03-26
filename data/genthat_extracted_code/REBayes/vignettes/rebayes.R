## ----preliminaries, echo=FALSE, warning = FALSE, message = FALSE, results='hide'----
hasMosek <- requireNamespace("Rmosek", quietly = TRUE)                
if(hasMosek) 
    hasMosek <- tryCatch(example(mosek)$value$response$code == 0,
			   warning = function(c) 0,
			   error = function(c) 0)
if (!hasMosek) {                                                                     
                knitr::opts_chunk$set(eval = FALSE)                                   
                msg <- paste("This vignette requires Mosek, but this system",
                             "does not have Mosek",
                             "installed, so code examples will not be evaluated.")
                msg <- paste(strwrap(msg), collapse="\n")
                message(msg) 
            }
require("REBayes")
knitr::render_sweave()
options(prompt = "R> ", continue = "+  ", digits = 2, show.signif.stars = FALSE)
cleanup <- FALSE

## ----N02setup, include=FALSE---------------------------------------------
N02.cap = "Kiefer Wolfowitz Estimation of a Gaussian Location Mixture:
The left panel is the (unknown) two component mixture density, the middle panel is the estimated
NPMLE mixing density and the right panel is the estimated Bayes rule for predicting 
$\\hat \\mu = \\delta (x)$ based on seeing  an observation $x$."
set.seed(1729) 

## ----N02, fig.height = 4, fig.width = 10, fig.cap = N02.cap--------------
# A simple Gaussian mixture model
par(mfrow = c(1,3))
x <- seq(-5, 6, by = 0.05)
plot(x, 0.9 * dnorm(x,0) + 0.1 * dnorm(x,2), type = "l",
    xlab = "x", ylab = expression(g(x)), main = "")
y <- rep(c(0,2), times = c(900,100)) + rnorm(1000)
z <- GLmix(y)
plot(z, xlab = expression(mu), ylab = expression(f(mu)), main = "")
plot(x, predict(z,x), type = "l", ylab = expression(delta(x)))

## ----N0Gsetup, include=FALSE---------------------------------------------
N0G.cap = "Kiefer Wolfowitz Estimation of a Gaussian Location Mixture:
The left panel is the (unknown) mixture density, the middle panel is the estimated
NPMLE mixing density and the right panel is the estimated Bayes rule for predicting 
$\\hat \\mu = \\delta (x)$ based on seeing  an observation $x$."
set.seed(1726) 

## ----N0G, fig.height = 4, fig.width = 10, fig.cap = N0G.cap--------------
# Another simple Gaussian mixture model
par(mfrow = c(1,3))
x <- seq(-5, 7, by = 0.05)
plot(x, 0.8 * dnorm(x,0) + 0.2 * dnorm(x,2,sqrt(2)), type = "l",
    xlab = "x", ylab = "g(x)", main = "")
y <- c(rep(0,800), rnorm(200, 2)) + rnorm(1000)
z <- GLmix(y)
plot(z, xlab = expression(mu), ylab = expression(f(mu)), main = "")
plot(x, predict(z,x), type = "l", ylab = expression(delta(x)))

## ----P01setup, include=FALSE---------------------------------------------
P01.cap = "Histogram of Claims per Exposure for 72 occupation groups."

## ----P01, fig.height = 4, fig.width = 6, fig.cap = P01.cap---------------
# Parametric Gamma vs Poisson mixture models for insurance claims
data("Norberg")
E <- Norberg$Exposure/344
X <- Norberg$Death
hist(X/E, 90, freq = TRUE, xlab = "X/E", main = "", ylab = "Frequency")

## ----P02setup, include=FALSE---------------------------------------------
P02.cap = "Estimated mixing distribution $G$ for $\\theta$ for the group insurance data. The left panel 
depicts to the Kiefer-Wolfowitz NPMLE estimator for $G$ with 1000 grid points. The right panel 
depicts the cube root of the mass associated with support points around 8. The smooth 
curve superimposed in the left panel corresponds to the parametric maximum likelihood
estimate of the mixing density assuming $G$ follows a Gamma distribution."

## ----P02, fig.height = 4, fig.width = 6, cache = TRUE, fig.cap = P02.cap----
# Maximum likelihood estimation of the Gamma model
logL<-  function(par, x, e){
    f <- choose(x + par[1] - 1, x) * 
	(par[2]/(e + par[2]))^par[1] * (e/(e+par[2]))^x 
    -sum(log(f))
    }
z <- optim(c(5,5), logL, x = X, e = E, hessian = TRUE)
sez <- sqrt(diag(solve(z$hessian)))
z <- z$par
# Estimation of the Poisson mixture model
f = Pmix(X, v = 1000, exposure = E, rtol = 1e-10)
# Now plot the comparison
par(mfrow=c(1,2))
plot(f$x,f$y/sum(f$y), type="l", xlab = expression(theta), 
    ylab = expression(f(theta)), ylim = c(0,1))
lines(f$x, dgamma(f$x, shape = z[1], rate = z[2]), col = 2)
plot(f$x,(f$y/sum(f$y))^(1/3), type="l", xlab = expression(theta), 
ylab = expression(f(theta)^{1/3}), ylim = c(0,1))

## ----P03setup, include=FALSE---------------------------------------------
P03.cap = "Comparison of the Parametric and the Nonparametric Empirical Bayes 
estimator of $\\theta_i$ for 72 occupation groups.  As indicated by the 45 degree
line there is good agreement between the parametric and nonparametric Bayes rules
except for the two groups appearing in the upper right corner of the plot."

## ----P03, fig.height = 4, fig.width = 6, fig.cap = P03.cap---------------
# Bayes rules for insurance application
PBrule <- (X + z[1])/(E + z[2])
NPBrule <- f$dy
plot(PBrule, NPBrule, cex = 0.5, 
     xlab = "P-EBayes", ylab = "NP-EBayes")
abline(c(0,1))

## ----W01setup, include=FALSE---------------------------------------------
W01.cap = "Raw and estimated mortality rates for Carey medflies by gender"

## ----W01, fig.height = 5, fig.width = 8, fig.cap = W01.cap---------------
data("flies") 
attach(flies)
# Weibull hazard function
hweibull <- function(s,alpha,lambda, f){ 
    Lambda<-outer((lambda*s)^(alpha),exp(f$x))
    Surv <- exp(-Lambda) %*% f$y/sum(f$y)
    A <- matrix(0, length(s), length(f$x))
    for (i in 1:length(s)){
        for (j in 1:length(f$x))
            A[i,j] <- dweibull(s[i],shape=alpha,
                 scale = lambda^(-1) * (exp(f$x[j]))^(-1/alpha))
       }
    g <- A %*% f$y
    g/(sum(g)*Surv)
}
ahat <- c(2.793, 2.909) # Gender specific Weibull shape parameters
counts <- tapply(num,list(age,female),"sum")
cols <- c("black","grey") 
labs <- c("Male","Female")
# Plot raw and estimated hazard functions by gender
for(g in 1:2){
   gc <- counts[!is.na(counts[,g]),g]
   freq <- gc/sum(gc)
   day <- as.numeric(names(gc))
   atrisk <- rev(cumsum(rev(gc)))
   h <- rev(diff(rev(c(atrisk,0))))/atrisk
   fW <- Weibullmix(day, m = 5000, alpha = ahat[g], weight = freq)
   hW <- hweibull(day, alpha = ahat[g], lambda = 1, fW)
   if(g == 1){ 
       plot(day[1:100],hW[1:100],type="l", xlim = c(0,110), 
	 ylim = c(0,.20), xlab = "Day", ylab = "Hazard")
       points(day[1:100], h[1:100], cex = 0.7)
       }
   else{
       lines(day[1:120],hW[1:120],col = cols[2])
       points(day[1:100], h[1:100], cex = 0.7, col = cols[2])
       }
   legend("topleft", labs, lty = rep(1,2), lwd = 1.5, col=cols)
   }

## ----W02setup, include=FALSE---------------------------------------------
W02.cap = "Initial Cage Density Effect in the Weibull Mixture Model:
Profile Log Likelihood (in 1000's) for the  cage density effect with
0.95 (Wilks) confidence interval in blue."

## ----W02, fig.height = 4, fig.width = 6, cache = TRUE, warning = FALSE, fig.cap = W02.cap----
# Profile likelihood estimation of initial cage density effect
counts <- tapply(num,list(age, begin),"sum")
freq <- c(counts)
day <- as.numeric(dimnames(counts)[[1]])
den <- as.numeric(dimnames(counts)[[2]])
day <- rep(day, 165)
den <- rep(den, each = 136)
s <- !is.na(freq)
day <- day[s]
den <- den[s]
freq <- freq[s]/sum(freq[s])
beta <- -10:10/10
logL <- beta
for(i in 1:length(beta)){
   f <- Weibullmix(day, m = 500, alpha = 2.95,
        lambda = exp(beta[i]*den), weight = freq)
   logL[i] <- f$logLik
   }
plot(beta, logL/1000, cex = 0.5, xlab = expression(beta), 
    ylab = "Profile Likelihood")
lines(beta, logL/1000)
# Wilks interval for cage density effect
fsp <- splinefun(beta, max(logL) - logL - qchisq(.95,1)/2)
blo <- uniroot(fsp,c(-1,-.5))$root
bhi <- uniroot(fsp,c(-.5, 0))$root
polygon(c(blo,bhi,bhi,blo), c(-40,-40,-30,-30), col = "lightblue")

## ----W03setup, include=FALSE---------------------------------------------
counts <- tapply(num,age,"sum")
freq <- counts/sum(counts)
day <- as.numeric(names(counts))
counts <- c("0.5" = 0, counts)
atrisk <- rev(cumsum(rev(counts)))
hazard <- rev(diff(rev(c(atrisk,0))))/atrisk
W03.cap = "Parametric versus Nonparametric Estimates of Medfly Mortality Rates"

## ----W03, fig.height = 4, fig.width = 6, cache = TRUE, warning = FALSE, fig.cap = W03.cap----
# Parametric Gamma fraility vs nonparametric Weibull mixture model 
GammaFrailty <- function(pars, age, num, hazard = FALSE){
    alpha <- pars[1]
    beta <- pars[2]
    delta <- pars[3]
    a <- (alpha/beta) * (age/beta)^(alpha - 1) 
    A <- (age/beta)^alpha 
    if(hazard) 
    	z <- a/(1 + delta * A)
    else 
	z <- -sum(num * (log(a) - (1 + 1/delta)* log(1 + delta * A)))
    z
    }
pars <- c(5, 20, 1) 
z <- optim(pars, GammaFrailty, age = age, num = num)
fitG <- z$par
fitW <- Weibullmix(day, m = 5000, alpha = 2.95, weights = freq)
s <- 1:110
day <- day[s]
hazard <- hazard[s]
plot(day, hazard, cex = 0.5)
lines(day, GammaFrailty(z$par,day,num, hazard = TRUE), lty = 2)
hW <- hweibull(day, alpha = 2.95, lambda = 1, fitW)
lines(day, hW, col = 2)
legend("topright", c("NPMLE", "Gamma"), col = 2:1, lty = 1:2)

## ----W04setup, include=FALSE---------------------------------------------
W04.cap = "Conditional Frailty at Various Ages:  Note that
the cube root of the frailties have been plotted to accentuate
the smaller mass points"

## ----W04, fig.height = 8, fig.width = 8, fig.cap = W04.cap---------------
# Conditional fraility at various ages
Gfrailt <- function(age, fit){
    alpha <- fit[1]
    beta <- fit[2]
    delta <- fit[3]
    A <- (age/beta)^alpha 
    (1 + delta * A)^(-1/delta)
    }
frailt <- function(v, t, alpha, fit){
        fv = fit$y/sum(fit$y)
        g = sum(exp(-v * (t^alpha))* fv)
        exp(-v * (t^alpha)) * fv/g
        }
par(mfrow = c(2,2))
v <- exp(fitW$x)
for(t in c(1.5, 20, 60, 100)){
    plot(log(v), frailt(v, t, alpha = 2.95, fitW)^(1/3), type="l", 
	main = paste("age =", t), 
	xlab = expression(log(theta)), 
	ylab = expression(h( theta , t)^{1/3}))
	}

## ----W05setup, include=FALSE---------------------------------------------
W05.cap = "Ten-Day Term Life Insurance Premia for Medflies of Various Ages"

## ----W05, fig.height = 4, fig.width = 6, fig.cap = W05.cap---------------
# Life insurance premia for medflies of various ages
premium <- function(v, t, k = 1, alpha, fit){
    if("Weibullmix" %in% class(fit)) {
    R <- t
    for(i in 1:length(t)){
	D <- exp(-v * t[i]^alpha) - exp(-v * (t[i] + k)^alpha)
	D <- D/exp(-v * t[i]^alpha)
	D[is.nan(D)] <- 1 
	R[i] <- sum(D * frailt(v, t[i], alpha, fit))
	} 
    }
    else  
	R <- (Gfrailt(t,fit) - Gfrailt(t+k, fit))/Gfrailt(t, fit)
    R
}
v <- exp(fitW$x)
R <- premium(v, day, k = 10, alpha = 2.95, fitW)
plot(day, R, type = "l", col = 2, ylab = "Premium")
R <- premium(v, day, k = 10, alpha = 2.95, fitG)
lines(day, R, lty = 2)
legend("topright", c("NPMLE", "Gamma"), col = 2:1, lty = 1:2)

