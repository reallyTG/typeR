library(derivmkts)


### Name: blksch
### Title: Black-Scholes option pricing
### Aliases: blksch bscall bsput assetcall assetput cashcall cashput

### ** Examples

s=40; k=40; v=0.30; r=0.08; tt=0.25; d=0;
bscall(s, k, v, r, tt, d)

## following returns the same price as previous
assetcall(s, k, v, r, tt, d) - k*cashcall(s, k, v, r, tt, d)

## return option prices for different strikes
bsput(s, k=38:42, v, r, tt, d)



