library(Rcapture)


### Name: openp
### Title: Loglinear Models for Open Population Capture-Recapture
###   Experiments
### Aliases: openp print.openp plot.openp
### Keywords: models

### ** Examples

data(duck)
op.m1 <- openp(duck, dfreq = TRUE)
plot(op.m1)

# To remove the capture history 111111.
keep2 <- apply(histpos.t(6), 1, sum) != 6
op.m2 <- openp(duck, dfreq = TRUE, keep = keep2)
op.m2

# To remove the capture histories with 5 captures or more
keep3 <- apply(histpos.t(6), 1, sum) < 5
op.m3 <- openp(duck, dfreq = TRUE, keep = keep3)
op.m3


data(mvole)
mvole.op <- periodhist(mvole, vt = rep(5, 6))
openp(mvole.op, dfreq = TRUE)



