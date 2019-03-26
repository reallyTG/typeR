library(spc)


### Name: scusum.crit
### Title: Compute decision intervals of CUSUM control charts (variance
###   charts)
### Aliases: scusum.crit
### Keywords: ts

### ** Examples

## Knoth (2006)
## compare with Table 1 (p. 507)
k <- 1.46 # sigma1 = 1.5
df <- 1
L0 <- 260.74
h <- scusum.crit(k, L0, 1, df)
h
# original value is 10



