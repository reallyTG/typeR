library(spc)


### Name: xsewma.arl
### Title: Compute ARLs of simultaneous EWMA control charts (mean and
###   variance charts)
### Aliases: xsewma.arl
### Keywords: ts

### ** Examples

## Knoth (2007)
## collocation results in Table 1
## Monte Carlo with 10^9 replicates: 252.307 +/- 0.0078

# process parameters
mu <- 0
sigma <- 1
# subgroup size n=5, df=n-1
df  <- 4
# lambda of mean chart
lx  <- .134
# c_mu^* = .345476571 = cx/sqrt(n) * sqrt(lx/(2-lx)
cx  <- .345476571*sqrt(df+1)/sqrt(lx/(2-lx))
# lambda of variance chart
ls  <- .1
# c_sigma = .477977
csu <- 1 + .477977
# matrix dimensions for mean and variance part
Nx  <- 25
Ns  <- 25
# mode of variance chart
SIDED <- "upper"

arl <- xsewma.arl(lx, cx, ls, csu, df, mu, sigma, Nx=Nx, Ns=Ns, sided=SIDED)
arl



