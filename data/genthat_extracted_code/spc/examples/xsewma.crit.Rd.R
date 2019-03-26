library(spc)


### Name: xsewma.crit
### Title: Compute critical values of simultaneous EWMA control charts
###   (mean and variance charts)
### Aliases: xsewma.crit
### Keywords: ts

### ** Examples

## Knoth (2007)
## results in Table 2

# subgroup size n=5, df=n-1
df  <- 4
# lambda of mean chart
lx  <- .134
# lambda of variance chart
ls  <- .1
# in-control ARL 
L0 <- 252.3
# matrix dimensions for mean and variance part
Nx  <- 25
Ns  <- 25
# mode of variance chart
SIDED <- "upper"

crit <- xsewma.crit(lx, ls, L0, df, sided=SIDED, Nx=Nx, Ns=Ns)
crit

## output as used in Knoth (2007)
crit["cx"]/sqrt(df+1)*sqrt(lx/(2-lx))
crit["cu"] - 1



