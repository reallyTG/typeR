library(VarSwapPrice)


### Name: black_scholes
### Title: Black-Scholes pricing for call and put options
### Aliases: black_scholes
### Keywords: Black-Scholes option pricing

### ** Examples

S      <- c( 100 )
X      <- c( 70 )
r      <- c( 0.05 )
t      <- c( 50 )
vol    <- c( 0.2 )
prices <- black_scholes(S, X, r, t, vol) 



