library(ape)


### Name: yule.time
### Title: Fits the Time-Dependent Yule Model
### Aliases: yule.time
### Keywords: models

### ** Examples

### define two models...
birth.logis <- function(a, b) 1/(1 + exp(-a*t - b)) # logistic
birth.step <- function(l1, l2, Tcl) { # 2 rates with one break-point
    ans <- rep(l1, length(t))
    ans[t > Tcl] <- l2
    ans
}
### ... and their primitives:
BIRTH.logis <- function(t) log(exp(-a*t) + exp(b))/a + t
BIRTH.step <- function(t)
{
    out <- numeric(length(t))
    sel <- t <= Tcl
    if (any(sel)) out[sel] <- t[sel] * l1
    if (any(!sel)) out[!sel] <- Tcl * l1 + (t[!sel] - Tcl) * l2
    out
}
data(bird.families)
### fit both models:
yule.time(bird.families, birth.logis)
yule.time(bird.families, birth.logis, BIRTH.logis) # same but faster
## Not run: yule.time(bird.families, birth.step)  # fails
yule.time(bird.families, birth.step, BIRTH.step,
          opti = "nlminb", start = c(.01, .01, 100))



