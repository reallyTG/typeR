library(R330)


### Name: stamford.df
### Title: Maximum Daily Ozone Concertrations
### Aliases: stamford.df
### Keywords: datasets

### ** Examples

data(stamford.df)
plot(stamford.df$days, stamford.df$ozone, xlab="Days", ylab="Ozone")
loess.stuff=loess(ozone~days, data=stamford.df, span=0.75)
lines(loess.stuff$x, loess.stuff$fitted)



