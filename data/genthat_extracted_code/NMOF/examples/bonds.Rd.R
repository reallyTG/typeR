library(NMOF)


### Name: vanillaBond
### Title: Pricing Plain-Vanilla Bonds
### Aliases: vanillaBond duration convexity ytm

### ** Examples

## ytm
cf <- c(5, 5, 5, 5, 5, 105)   ## cashflows
times <- 1:6                  ## maturities
y <- 0.0127                   ## the "true" yield
b0 <- vanillaBond(cf, times, yields = y)
cf <- c(-b0, cf); times <- c(0, times)
ytm(cf, times)

## ... with offset
cf <- c(5, 5, 5, 5, 5, 105)   ## cashflows
times <- 1:6                  ## maturities
y <- 0.02 + 0.01              ## risk-free 2% + risk-premium 1%
b0 <- vanillaBond(cf, times, yields = y)
cf <- c(-b0, cf); times <- c(0, times)
ytm(cf, times, offset = 0.02) ## ... only the risk-premium

cf <- c(5, 5, 5, 5, 5, 105)   ## cashflows
times <- 1:6                  ## maturities
y <- NS(c(6,9,10,5)/100, times) ## risk-premium 1%
b0 <- vanillaBond(cf, times, yields = y + 0.01)
cf <- c(-b0, cf); times <- c(0, times)
ytm(cf, times, offset = c(0,y)) ## ... only the risk-premium

## bonds
cf <- c(5, 5, 5, 5, 5, 105)   ## cashflows
times <- 1:6                  ## maturities
df <- 1/(1+y)^times           ## discount factors
all.equal(vanillaBond(cf, times, df),
          vanillaBond(cf, times, yields = y))

## ... using Nelson--Siegel
vanillaBond(cf, times, yields = NS(c(0.03,0,0,1), times))

## several bonds
##   cashflows are numeric vectors in a list 'cf',
##   times-to-payment are are numeric vectors in a
##   list 'times'

times <- list(1:3,
              1:4,
              0.5 + 0:5)
cf <- list(c(6, 6,          106),
           c(4, 4, 4,       104),
           c(2, 2, 2, 2, 2, 102))

alltimes <- sort(unique(unlist(times)))
M <- array(0, dim = c(length(cf), length(alltimes)))
for (i in seq_along(times))
    M[i, match(times[[i]], alltimes)] <- cf[[i]]
rownames(M) <- paste("bond.", 1:3, sep = "")
colnames(M) <- format(alltimes, nsmall = 1)

vanillaBond(cf = M, times = alltimes, yields = 0.02)

## duration/convexity
cf <- c(5, 5, 5, 5, 5, 105)   ## cashflows
times <- 1:6                  ## maturities
y <- 0.0527                   ## yield to maturity

d <- 0.001                   ## change in yield (+10 bp)
vanillaBond(cf, times, yields = y + d) - vanillaBond(cf, times, yields = y)

duration(cf, times, yield = y, raw = TRUE) * d

duration(cf, times, yield = y, raw = TRUE) * d +
    convexity(cf, times, yield = y, raw = TRUE)/2 * d^2




