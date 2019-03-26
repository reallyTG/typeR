library(derivmkts)


### Name: implied
### Title: Black-Scholes implied volatility and price
### Aliases: implied .tol bscallimpvol bsputimpvol bscallimps bsputimps
### Keywords: datasets

### ** Examples

s=40; k=40; v=0.30; r=0.08; tt=0.25; d=0;
bscallimpvol(s, k, r, tt, d, 4)
bsputimpvol(s, k, r, tt, d, 4)
bscallimps(s, k, v, r, tt, d, 4)
bsputimps(s, k, v, r, tt, d, 4)




