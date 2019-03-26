library(derivmkts)


### Name: jumps
### Title: Option pricing with jumps
### Aliases: jumps cashjump assetjump mertonjump

### ** Examples

s <- 40; k <- 40; v <- 0.30; r <- 0.08; tt <- 2; d <- 0;
lambda <- 0.75; alphaj <- -0.05; vj <- .35;
bscall(s, k, v, r, tt, d)
bsput(s, k, v, r, tt, d)
mertonjump(s, k, v, r, tt, d, 0, 0, 0)
mertonjump(s, k, v, r, tt, d, lambda, alphaj, vj)

## following returns the same price as previous
c(1, -1)*(assetjump(s, k, v, r, tt, d, lambda, alphaj, vj) -
k*cashjump(s, k, v, r, tt, d, lambda, alphaj, vj))

## return call prices for different strikes
kseq <- 20:60
cp <- mertonjump(s, kseq, v, r, tt, d, lambda, alphaj,
    vj)[paste0('Call', 1:length(kseq))]

## Implied volatilities: Compute Black-Scholes implied volatilities
## for options priced using the Merton jump model
vimp <- sapply(1:length(kseq), function(i) bscallimpvol(s, kseq[i],
    r, tt, d, cp[i]))
plot(kseq, vimp, main='Implied volatilities', xlab='Strike',
    ylab='Implied volatility', ylim=c(0.30, 0.50))



