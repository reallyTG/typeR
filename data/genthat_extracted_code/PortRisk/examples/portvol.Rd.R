library(PortRisk)


### Name: portvol, mctr, cctr
### Title: Portfolio Volatility and Contribution to Total Volatility Risk
###   (MCTR & CCTR)
### Aliases: portvol mctr cctr

### ** Examples

data(SnP500Returns)

# consider the portfolio containing the first 4 stocks
pf <- colnames(SnP500Returns)[1:4]

st <- "2013-01-01" # start date
en <- "2013-01-31" # end date

# suppose the amount of investments in the above stocks are
# $1,000, $2,000, $3,000 & $1,000 respectively
wt <- c(1000,2000,3000,1000) # weights

# portfolio volatility for the portfolio 'pf' with equal (default) weights
pv1 <- portvol(pf, start = st, end = en,
                data = SnP500Returns)

# portfolio volatility for the portfolio 'pf' with weights as 'wt'
pv2 <- portvol(pf, weights = wt, start = st, end = en,
                data = SnP500Returns)

# similarly,
# mctr for the portfolio 'pf' with weights as 'wt'
mc <- mctr(pf, weights = wt, start = st, end = en,
            data = SnP500Returns)

# cctr for the portfolio 'pf' with weights as 'wt'
cc <- cctr(pf, weights = wt, start = st, end = en,
            data = SnP500Returns)

sum(cc) == pv2
# note that, sum of the cctr values is the portfolio volatility



