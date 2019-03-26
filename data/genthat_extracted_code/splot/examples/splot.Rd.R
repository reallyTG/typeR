library(splot)


### Name: splot
### Title: Split Plot
### Aliases: splot

### ** Examples

# simulating data
n=2000
dat=data.frame(sapply(c('by','bet1','bet2'),function(c)sample(0:1,n,TRUE)))
dat$x=with(dat,
  rnorm(n)+by*-.4+by*bet1*-.3+by*bet2*.3+bet1*bet2*.9-.8+rnorm(n,0,by)
)
dat$y=with(dat,
  x*.2+by*.3+bet2*-.6+bet1*bet2*.8+x*by*bet1*-.5+x*by*bet1*bet2*-.5
  +rnorm(n,5)+rnorm(n,-1,.1*x^2)
)

# looking at the distribution of y between bets split by by
splot(y, by=by, between=c(bet1, bet2), data=dat)

# looking at quantile splits of y in y by x
splot(y~x*y, dat, split='quantile')

# looking at y by x between bets
splot(y~x, dat, between=c(bet1, bet2))

# sequentially adding levels of split
splot(y~x*by, dat)
splot(y~x*by*bet1, dat)
splot(y~x*by*bet1*bet2, dat)

# same as the last but entered by name
splot(y, x=x, by=by, between=c(bet1, bet2), data=dat)

# zooming in on one of the windows
splot(y~x*by, dat, bet1==1&bet2==0)

# comparing an adjusted lm prediction line with a loess line
# this could also be entered as y ~ poly(x,3)
splot(y~x+x^2+x^3, dat, bet1==1&bet2==0&by==1, add={
  lines(x[order(x)], loess(y~x)$fitted[order(x)], lty=2)
  legend('topright', c('lm', 'loess'), lty=c(1, 2), lwd=c(2, 1), bty='n')
})

# looking at different versions of x added to y
splot(cbind(
  Raw=y+x,
  Sine=y+sin(x),
  Cosine=y+cos(x),
  Tangent=y+tan(x)
)~x, dat, myl=c(-10,15), lines='loess', laby='y + versions of x')




