library(OIdata)


### Name: sp500
### Title: Financial information for 50 S&P 500 companies
### Aliases: sp500
### Keywords: datasets SP 500 stocks financial money

### ** Examples

data(sp500)
plot(sp500$ent_value, sp500$earn_before)

plot(sp500$ev_over_rev, sp500$forward_pe)

plot(sp500$ent_value, sp500$earn_before, log="xy")

plot(sp500$ev_over_rev, sp500$forward_pe, log="xy")



