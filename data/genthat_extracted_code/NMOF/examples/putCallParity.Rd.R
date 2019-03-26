library(NMOF)


### Name: putCallParity
### Title: Put-Call Parity
### Aliases: putCallParity

### ** Examples

S <- 100; X <- 100; tau <- 1; r <- 0.02; q <- 0.0;
vol <- 0.3; D <- 20; tauD <- 0.5 
call <- vanillaOptionEuropean(S, X, tau, r, q, vol^2,
                              tauD = tauD, D = D, type = "call")$value
put  <- vanillaOptionEuropean(S, X, tau, r, q, vol^2,
                              tauD = tauD, D = D, type = "put")$value

## recover the call from the put (et vice versa)
all.equal(call, putCallParity("call", put = put,  S=S, X=X, tau=tau,
                              r=r, q=q, tauD=tauD, D=D))
all.equal(put, putCallParity("put",  call = call, S=S, X=X, tau=tau,
                             r=r, q=q, tauD=tauD, D=D))


## Black--Scholes--Merton with with 'callCF'
S <- 100; X <- 90; tau <- 1; r <- 0.02; q <- 0.08
v <- 0.2^2  ## variance, not volatility

(ccf <- callCF(cf = cfBSM, S = S, X = X, tau = tau, r = r, q = q,
                 v = v, implVol = TRUE))
all.equal(ccf$value, 
          vanillaOptionEuropean(S, X, tau, r, q, v, type = "call")$value)
all.equal(
  putCallParity("put", call=ccf$value, S=S, X=X, tau=tau, r=r, q=q),
  vanillaOptionEuropean(S, X, tau, r, q, v, type = "put")$value)



