library(spc)


### Name: lns2ewma.arl
### Title: Compute ARLs of EWMA ln S^2 control charts (variance charts)
### Aliases: lns2ewma.arl
### Keywords: ts

### ** Examples

lns2ewma.ARL <- Vectorize("lns2ewma.arl", "sigma")

## Crowder/Hamilton (1992)
## moments of ln S^2
E_log_gamma <- function(df) log(2/df) + digamma(df/2)
V_log_gamma <- function(df) trigamma(df/2)
E_log_gamma_approx <- function(df) -1/df - 1/3/df^2 + 2/15/df^4
V_log_gamma_approx <- function(df) 2/df + 2/df^2 + 4/3/df^3 - 16/15/df^5

## results from Table 3 ( upper chart with reflection at 0 = log(sigma0=1) )
## original entries are (lambda = 0.05, K = 1.06, df=n-1=4)
# sigma   ARL
# 1       200
# 1.1      43
# 1.2      18
# 1.3      11
# 1.4       7.6
# 1.5       6.0
# 2         3.2

df <- 4
lambda <- .05
K <- 1.06
cu <- K * sqrt( lambda/(2-lambda) * V_log_gamma_approx(df) )

sigmas <- c(1 + (0:5)/10, 2)
arls <- round(lns2ewma.ARL(lambda, 0, cu, sigmas, df, hs=0, sided="upper"), digits=1)
data.frame(sigmas, arls)

## Knoth (2005)
## compare with Table 3 (p. 351)
lambda <- .05
df <- 4
K <- 1.05521
cu <- 1.05521 * sqrt( lambda/(2-lambda) * V_log_gamma_approx(df) )

## upper chart with reflection at sigma0=1 in Table 4
## original entries are
# sigma   ARL_0    ARL_-.267
# 1       200.0    200.0
# 1.1      43.04    41.55
# 1.2      18.10    19.92
# 1.3      10.75    13.11
# 1.4       7.63     9.93
# 1.5       5.97     8.11
# 2         3.17     4.67

M <- -0.267
cuM <- lns2ewma.crit(lambda, 200, df, cl=M, hs=M, r=60)[2]
arls1 <- round(lns2ewma.ARL(lambda, 0, cu, sigmas, df, hs=0, sided="upper"), digits=2)
arls2 <- round(lns2ewma.ARL(lambda, M, cuM, sigmas, df, hs=M, sided="upper", r=60), digits=2)
data.frame(sigmas, arls1, arls2)



