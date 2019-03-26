library(minpack.lm)


### Name: nlsLM
### Title: Standard 'nls' framework that uses 'nls.lm' for fitting
### Aliases: nlsLM
### Keywords: nonlinear optimize regression

### ** Examples

### Examples from 'nls' doc ###
DNase1 <- subset(DNase, Run == 1)
## using a selfStart model
fm1DNase1 <- nlsLM(density ~ SSlogis(log(conc), Asym, xmid, scal), DNase1)
## using logistic formula
fm2DNase1 <- nlsLM(density ~ Asym/(1 + exp((xmid - log(conc))/scal)),
                 data = DNase1, 
                 start = list(Asym = 3, xmid = 0, scal = 1))

## all generics are applicable
coef(fm1DNase1)
confint(fm1DNase1)
deviance(fm1DNase1)
df.residual(fm1DNase1)
fitted(fm1DNase1)
formula(fm1DNase1)
logLik(fm1DNase1)
predict(fm1DNase1)
print(fm1DNase1)
profile(fm1DNase1)
residuals(fm1DNase1)
summary(fm1DNase1)
update(fm1DNase1)
vcov(fm1DNase1)
weights(fm1DNase1)

## weighted nonlinear regression using 
## inverse squared variance of the response
## gives same results as original 'nls' function
Treated <- Puromycin[Puromycin$state == "treated", ]
var.Treated <- tapply(Treated$rate, Treated$conc, var)
var.Treated <- rep(var.Treated, each = 2)
Pur.wt1 <- nls(rate ~ (Vm * conc)/(K + conc), data = Treated, 
               start = list(Vm = 200, K = 0.1), weights = 1/var.Treated^2)
Pur.wt2 <- nlsLM(rate ~ (Vm * conc)/(K + conc), data = Treated, 
               start = list(Vm = 200, K = 0.1), weights = 1/var.Treated^2)
all.equal(coef(Pur.wt1), coef(Pur.wt2))

## 'nlsLM' can fit zero-noise data
## in contrast to 'nls'
x <- 1:10
y <- 2*x + 3                           
## Not run: 
##D nls(y ~ a + b * x, start = list(a = 0.12345, b = 0.54321))
## End(Not run)
nlsLM(y ~ a + b * x, start = list(a = 0.12345, b = 0.54321))

### Examples from 'nls.lm' doc
## values over which to simulate data 
x <- seq(0,5, length = 100)
## model based on a list of parameters 
getPred <- function(parS, xx) parS$a * exp(xx * parS$b) + parS$c 
## parameter values used to simulate data
pp <- list(a = 9,b = -1, c = 6) 
## simulated data with noise  
simDNoisy <- getPred(pp, x) + rnorm(length(x), sd = .1)
## make model
mod <- nlsLM(simDNoisy ~ a * exp(b * x) + c, 
             start = c(a = 3, b = -0.001, c = 1), 
             trace = TRUE)     
## plot data
plot(x, simDNoisy, main = "data")
## plot fitted values
lines(x, fitted(mod), col = 2, lwd = 2)

## create declining cosine
## with noise
TT <- seq(0, 8, length = 501)
tau <- 2.2
N0 <- 1000
a <- 0.25
f0 <- 8
Ndet <- N0 * exp(-TT/tau) * (1 + a * cos(f0 * TT))
N <- Ndet +  rnorm(length(Ndet), mean = Ndet, sd = .01 * max(Ndet))
## make model
mod <- nlsLM(N ~ N0 * exp(-TT/tau) * (1 + a * cos(f0 * TT)), 
             start = c(tau = 2.2, N0 = 1500, a = 0.25, f0 = 10), 
             trace = TRUE)  

## plot data
plot(TT, N, main = "data")
## plot fitted values
lines(TT, fitted(mod), col = 2, lwd = 2)



