library(NMOF)


### Name: vanillaOptionEuropean
### Title: Pricing Plain-Vanilla Options (European and American)
### Aliases: vanillaOptionEuropean vanillaOptionAmerican
###   vanillaOptionImpliedVol

### ** Examples

S <- 100; X <- 100; tau <- 1; r <- 0.02; q <- 0.06; vol <- 0.3
unlist(vanillaOptionEuropean(S, X, tau, r, q, vol^2, type = "put"))

S <- 100; X <- 110; tau <- 1; r <- 0.1; q <- 0.06; vol <- 0.3; type <- "put"
unlist(vanillaOptionAmerican(S, X, tau, r, q, vol^2, type = type,
                             greeks = TRUE))

## compute rho for 1% move
h <- 0.01
(vanillaOptionAmerican(S, X, tau, r + h, q, vol^2,
    type = type, greeks = FALSE) -
 vanillaOptionAmerican(S, X, tau, r, q, vol^2,
    type = type, greeks = FALSE)) / (h*100)

## compute vega for 1% move
h <- 0.01
(vanillaOptionAmerican(S, X, tau, r, q,(vol + h)^2,
    type = type, greeks = FALSE) -
 vanillaOptionAmerican(S, X, tau, r, q, vol^2,
    type = type, greeks = FALSE)) / (h*100)



S <- 100; X <- 100
tau <- 1; r <- 0.05; q <- 0.00
D <- c(1,2); tauD <- c(0.3,.6)
type <- "put"
v <- 0.245^2  ## variance, not volatility

p <- vanillaOptionEuropean(S = S, X = X, tau, r, q, v = v,
                           tauD = tauD, D = D, type = type, greeks = FALSE)
vanillaOptionImpliedVol(exercise = "european", price = p,
     S = S, X = X, tau = tau, r = r, q = q, tauD = tauD, D = D, type = type)

p <- vanillaOptionAmerican(S = S, X = X, tau, r, q, v = v,
     tauD = tauD, D = D, type = type, greeks = FALSE)
vanillaOptionImpliedVol(exercise = "american", price = p,
     S = S, X = X, tau = tau, r = r, q = q, tauD = tauD, D = D, type =
     type, uniroot.control = list(interval = c(0.01, 0.5)))


## compute implied q
S <- 100; X <- 100
tau <- 1; r <- 0.05; q <- 0.072
v <- 0.22^2  ## variance, not volatility

call <- vanillaOptionEuropean(S=S, X = X, tau=tau, r=r, q=q, v=v,
         type = "call", greeks = FALSE)
put  <- vanillaOptionEuropean(S=S, X = X, tau=tau, r=r, q=q, v=v,
         type = "put", greeks = FALSE)

# ... the simple way
-(log(call + X * exp(-tau*r) - put) - log(S)) / tau

# ... the complicated way :-)
volDiffCreate <- function(exercise, call, put, S, X, tau, r) {
    f <- function(q) {
        cc <- vanillaOptionImpliedVol(exercise = exercise, price = call,
            S = S, X = X, tau = tau, r = r, q = q, type = "call")
        pp <- vanillaOptionImpliedVol(exercise = exercise, price = put,
            S = S, X = X, tau = tau, r = r, q = q, type = "put")
        abs(cc - pp)
    }
    f
}
f <- volDiffCreate(exercise = "european",
                   call = call, put = put, S = S, X = X, tau = tau, r)
optimise(f,interval = c(0, 0.2))$minimum

##
S <- 100; X <- 100
tau <- 1; r <- 0.05; q <- 0.072
v <- 0.22^2  ## variance, not volatility
vol <- 0.22

vanillaOptionEuropean(S=S, X = X, tau=tau, r=r, q=q, v=v,     ## with variance
                      type = "call", greeks = FALSE) 
vanillaOptionEuropean(S=S, X = X, tau=tau, r=r, q=q, vol=vol, ## with vol
                      type = "call", greeks = FALSE)
vanillaOptionEuropean(S=S, X = X, tau=tau, r=r, q=q, vol=vol, ## with vol
                      type = "call", greeks = FALSE, v = 0.2^2)




