library(agridat)


### Name: goulden.eggs
### Title: Sample of egg weights on 24 consecutive days
### Aliases: goulden.eggs
### Keywords: datasets

### ** Examples

data(goulden.eggs)
dat <- goulden.eggs

if(require(qicharts)){
  # Figure 19-4 of Goulden. (Goulden uses 1/n when calculating std dev)
  op <- par(mfrow=c(2,1))
  qic(weight, x = day, data = dat, chart = 'xbar',
      main = 'goulden.eggs - Xbar chart',
      xlab = 'Date', ylab = 'Avg egg weight' )
  qic(weight, x = day, data = dat, chart = 's',
      main = 'goulden.eggs - S chart',
      xlab = 'Date', ylab = 'Std dev egg weight' )
  par(op)
}




