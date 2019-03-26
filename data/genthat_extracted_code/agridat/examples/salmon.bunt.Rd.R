library(agridat)


### Name: salmon.bunt
### Title: Fungus infection in varieties of wheat
### Aliases: salmon.bunt
### Keywords: datasets

### ** Examples


data(salmon.bunt)
dat <- salmon.bunt

d2 <- aggregate(pct~bunt+gen, dat, FUN=mean) # average reps
d2$gen <- reorder(d2$gen, d2$pct)
d2$bunt <- reorder(d2$bunt, d2$pct)
# Some wheat varieties (Hohenheimer) are resistant to all bunts, and some (Hybrid128)
# are susceptible to all bunts.  Note the groups of bunt races that are similar,
# such as the first 4 rows of this plot.  Also note the strong wheat*bunt interaction.
require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(pct~gen+bunt,d2, col.regions=redblue,
          main="salmon.bunt percent of heads infected",
          xlab="Wheat variety", ylab="bunt line")

# We don't have individual counts, so use beta regression
if(require(betareg) & require(latticeExtra)){
  dat$y <- dat$pct/100 + .001 # Beta regression does not allow 0
  dat$gen <- reorder(dat$gen, dat$pct) # For a prettier dot plot

  m1 <- betareg(y ~ gen + bunt + gen:bunt, data=dat)

  # Construct 95 percent confidence intervals
  p1 <- cbind(dat,
              lo = predict(m1, type='quantile', at=.025),
              est = predict(m1, type='quantile', at=.5),
              up = predict(m1, type='quantile', at=.975))
  p1 <- subset(p1, rep=="R1")

  # Plot the model intervals over the original data
  # require(latticeExtra)
  dotplot(bunt~y|gen, data=dat, pch='x', col='red',
          main="Observed data and 95 pct intervals for bunt infection") +
            segplot(bunt~lo+up|gen, data=p1, centers=est, draw.bands=FALSE)
}

# To evaluate wheat, we probably want to include bunt as a random effect...




