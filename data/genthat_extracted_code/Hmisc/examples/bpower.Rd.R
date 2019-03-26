library(Hmisc)


### Name: bpower
### Title: Power and Sample Size for Two-Sample Binomial Test
### Aliases: bpower bsamsize ballocation bpower.sim
### Keywords: htest category

### ** Examples

bpower(.1, odds.ratio=.9, n=1000, alpha=c(.01,.05))
bpower.sim(.1, odds.ratio=.9, n=1000)
bsamsize(.1, .05, power=.95)
ballocation(.1, .5, n=100)


# Plot power vs. n for various odds ratios  (base prob.=.1)
n  <- seq(10, 1000, by=10)
OR <- seq(.2,.9,by=.1)
plot(0, 0, xlim=range(n), ylim=c(0,1), xlab="n", ylab="Power", type="n")
for(or in OR) {
  lines(n, bpower(.1, odds.ratio=or, n=n))
  text(350, bpower(.1, odds.ratio=or, n=350)-.02, format(or))
}


# Another way to plot the same curves, but letting labcurve do the
# work, including labeling each curve at points of maximum separation
pow <- lapply(OR, function(or,n)list(x=n,y=bpower(p1=.1,odds.ratio=or,n=n)),
              n=n)
names(pow) <- format(OR)
labcurve(pow, pl=TRUE, xlab='n', ylab='Power')


# Contour graph for various probabilities of outcome in the control
# group, fixing the odds ratio at .8 ([p2/(1-p2) / p1/(1-p1)] = .8)
# n is varied also
p1 <- seq(.01,.99,by=.01)
n  <- seq(100,5000,by=250)
pow <- outer(p1, n, function(p1,n) bpower(p1, n=n, odds.ratio=.8))
# This forms a length(p1)*length(n) matrix of power estimates
contour(p1, n, pow)



