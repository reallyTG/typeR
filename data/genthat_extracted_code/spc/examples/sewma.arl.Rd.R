library(spc)


### Name: sewma.arl
### Title: Compute ARLs of EWMA control charts (variance charts)
### Aliases: sewma.arl
### Keywords: ts

### ** Examples

## Knoth (2005)
## compare with Table 1 (p. 347): 249.9997
## Monte Carlo with 10^9 replicates: 249.9892 +/- 0.008
l <- .025
df <- 1
cu <- 1 + 1.661865*sqrt(l/(2-l))*sqrt(2/df)
sewma.arl(l,0,cu,1,df)

## ARL values for upper and lower EWMA charts with reflecting barriers
## (reflection at in-control level sigma0 = 1)
## examples from Knoth (2006), Tables 4 and 5

Ssewma.arl <- Vectorize("sewma.arl", "sigma")

## upper chart with reflection at sigma0=1 in Table 4
## original entries are
# sigma   ARL
# 1       100.0
# 1.01    85.3
# 1.02    73.4
# 1.03    63.5
# 1.04    55.4
# 1.05    48.7
# 1.1     27.9
# 1.2     12.9
# 1.3     7.86
# 1.4     5.57
# 1.5     4.30
# 2       2.11

## Not run: 
##D l <- 0.15
##D df <- 4
##D cu <- 1 + 2.4831*sqrt(l/(2-l))*sqrt(2/df)
##D sigmas <- c(1 + (0:5)/100, 1 + (1:5)/10, 2)
##D arls <- round(Ssewma.arl(l, 1, cu, sigmas, df, sided="Rupper", r=100), digits=2)
##D data.frame(sigmas, arls)
## End(Not run)

## lower chart with reflection at sigma0=1 in Table 5
## original entries are
# sigma   ARL
# 1       200.04
# 0.9     38.47
# 0.8     14.63
# 0.7     8.65
# 0.6     6.31

## Not run: 
##D l <- 0.115
##D df <- 5
##D cl <- 1 - 2.0613*sqrt(l/(2-l))*sqrt(2/df)
##D sigmas <- c((10:6)/10)
##D arls <- round(Ssewma.arl(l, cl, 1, sigmas, df, sided="Rlower", r=100), digits=2)
##D data.frame(sigmas, arls)
## End(Not run)



