library(spc)


### Name: sewma.crit
### Title: Compute critical values of EWMA control charts (variance charts)
### Aliases: sewma.crit
### Keywords: ts

### ** Examples

## Mittag et al. (1998)
## compare their upper critical value 2.91 that
## leads to the upper control limit via the formula shown below
## (for the usual upper EWMA \eqn{S^2}{S^2}).
## See Knoth (2006b) for a discussion of this EWMA setup and it's evaluation.

l  <- 0.18
L0 <- 250
df <- 4
limits <- sewma.crit(l, L0, df)
limits["cu"]

limits.cu.mittag_et_al <- 1 + sqrt(l/(2-l))*sqrt(2/df)*2.91
limits.cu.mittag_et_al

## Knoth (2005)
## reproduce the critical value given in Figure 2 (c=1.661865) for
## upper EWMA \eqn{S^2}{S^2} with df=1

l  <- 0.025
L0 <- 250
df <- 1
limits <- sewma.crit(l, L0, df)
cv.Fig2 <- (limits["cu"]-1)/( sqrt(l/(2-l))*sqrt(2/df) )
cv.Fig2

## the small difference (sixth digit after decimal point) stems from
## tighter criterion in the secant rule implemented in the R package.

## demo of unbiased ARL curves
## Deploy, please, not matrix dimensions smaller than 50 -- for the
## sake of accuracy, the value 80 was used.
## Additionally, this example needs between 1 and 2 minutes on a 1.6 Ghz box. 

## Not run: 
##D l  <- 0.1
##D L0 <- 500
##D df <- 4
##D limits <- sewma.crit(l, L0, df, sided="two", mode="unbiased", r=80)
##D SEWMA.arl <- Vectorize(sewma.arl, "sigma")
##D SEWMA.ARL <- function(sigma) 
##D   SEWMA.arl(l, limits[1], limits[2], sigma, df, sided="two", r=80)
##D layout(matrix(1:2, nrow=1))
##D curve(SEWMA.ARL, .75, 1.25, log="y")
##D curve(SEWMA.ARL, .95, 1.05, log="y")
## End(Not run)
# the above stuff needs about 1 minute

## control limits for upper and lower EWMA charts with reflecting barriers
## (reflection at in-control level sigma0 = 1)
## examples from Knoth (2006a), Tables 4 and 5

## Not run: 
##D ## upper chart with reflection at sigma0=1 in Table 4: c = 2.4831
##D l <- 0.15
##D L0 <- 100
##D df <- 4
##D limits <- sewma.crit(l, L0, df, cl=1, sided="Rupper", r=100)
##D cv.Tab4 <- (limits["cu"]-1)/( sqrt(l/(2-l))*sqrt(2/df) )
##D cv.Tab4
##D 
##D ## lower chart with reflection at sigma0=1 in Table 5: c = 2.0613
##D l <- 0.115
##D L0 <- 200
##D df <- 5
##D limits <- sewma.crit(l, L0, df, cu=1, sided="Rlower", r=100)
##D cv.Tab5 <- -(limits["cl"]-1)/( sqrt(l/(2-l))*sqrt(2/df) )
##D cv.Tab5
## End(Not run)



