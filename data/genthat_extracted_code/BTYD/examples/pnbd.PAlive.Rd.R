library(BTYD)


### Name: pnbd.PAlive
### Title: Pareto/NBD P(Alive)
### Aliases: pnbd.PAlive

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)

pnbd.PAlive(params, x=0, t.x=0, T.cal=39)
# 0.2924031; P(Alive) of a customer who made no repeat transactions.

pnbd.PAlive(params, x=23, t.x=39, T.cal=39)
# 1; P(Alive) of a customer who has the same recency and total
# time observed.

pnbd.PAlive(params, x=5:20, t.x=30, T.cal=39)
# Note the "increasing frequency paradox".

# To visualize the distribution of P(Alive) across customers:

data(cdnowSummary)
cbs <- cdnowSummary$cbs
params <- pnbd.EstimateParameters(cbs)
p.alives <- pnbd.PAlive(params, cbs[,"x"], cbs[,"t.x"], cbs[,"T.cal"])
plot(density(p.alives))



