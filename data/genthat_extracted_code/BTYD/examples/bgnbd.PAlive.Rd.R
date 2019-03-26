library(BTYD)


### Name: bgnbd.PAlive
### Title: BG/NBD P(Alive)
### Aliases: bgnbd.PAlive

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)

bgnbd.PAlive(params, x=23, t.x=39, T.cal=39)
# P(Alive) of a customer who has the same recency and total
# time observed.

bgnbd.PAlive(params, x=5:20, t.x=30, T.cal=39)
# Note the "increasing frequency paradox".

# To visualize the distribution of P(Alive) across customers:

data(cdnowSummary)
cbs <- cdnowSummary$cbs
params <- bgnbd.EstimateParameters(cbs, par.start = c(0.243, 4.414, 0.793, 2.426))
p.alives <- bgnbd.PAlive(params, cbs[,"x"], cbs[,"t.x"], cbs[,"T.cal"])
plot(density(p.alives))



