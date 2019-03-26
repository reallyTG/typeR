library(tergm)


### Name: tergm.godfather
### Title: A function to apply a given series of changes to a network.
### Aliases: tergm.godfather

### ** Examples



g1 <- network.initialize(10, dir=FALSE)
g1[1,2] <- 1
g1[3,4] <- 1
g1 %n% "time" <- 0
g1 %n% "lasttoggle" <- -1-rgeom(network.dyadcount(g1),1/4)

dc <- matrix(rnorm(100),10,10); dc <- dc+t(dc)

# Simulate a network, tracking its statistics.
simnet <- simulate(g1, formation=~edges, dissolution=~edges, coef.form=-1, coef.diss=1,
                   time.slices=50, monitor=~degree(1)+mean.age+degree.mean.age(1)+
                                            mean.age(log=TRUE)+degree.mean.age(1,log=TRUE)+
                                            degrange(1,3)+mean.age+degrange.mean.age(1,3)+
                                            mean.age(log=TRUE)+degrange.mean.age(1,3,log=TRUE)+
                                            edge.ages+edgecov(dc)+edgecov.ages(dc),
                   output="networkDynamic")

sim.stats <- attr(simnet, "stats")

print(head(sim.stats))
sim.stats <- as.matrix(sim.stats)

# Replay the simulation using a networkDynamic, monitoring a potentially different set of
# statistics (but same in this case).
gf1.stats <- tergm.godfather(simnet~degree(1)+mean.age+degree.mean.age(1)+
                                    mean.age(log=TRUE)+degree.mean.age(1,log=TRUE)+
                                    degrange(1,3)+mean.age+degrange.mean.age(1,3)+
                                    mean.age(log=TRUE)+degrange.mean.age(1,3,log=TRUE)+
                                    edge.ages+edgecov(dc)+edgecov.ages(dc),
                             start=0, end=50)

print(head(gf1.stats))
gf1.stats <- as.matrix(gf1.stats)

# Replay the simulation using the initial network + list of changes.

gf2.stats <- tergm.godfather(g1~degree(1)+mean.age+degree.mean.age(1)+
                                mean.age(log=TRUE)+degree.mean.age(1,log=TRUE)+
                                degrange(1,3)+mean.age+degrange.mean.age(1,3)+
                                mean.age(log=TRUE)+degrange.mean.age(1,3,log=TRUE)+
                                edge.ages+edgecov(dc)+edgecov.ages(dc),
                             start=0, end=50, changes=attr(simnet,"changes"))

print(head(gf2.stats))
gf2.stats <- as.matrix(gf2.stats)

# We can also compare them to the network statistics summarized.
summ.stats <- summary(simnet~degree(1)+mean.age+degree.mean.age(1)+
                             mean.age(log=TRUE)+degree.mean.age(1,log=TRUE)+
                             degrange(1,3)+mean.age+degrange.mean.age(1,3)+
                             mean.age(log=TRUE)+degrange.mean.age(1,3,log=TRUE)+
                             edge.ages+edgecov(dc)+edgecov.ages(dc), at=1:50)

print(head(summ.stats))

tol <- sqrt(.Machine$double.eps)
# If they aren't all identical, we are in trouble.
stopifnot(all.equal(sim.stats,gf1.stats),
          all.equal(sim.stats,gf2.stats),
          all.equal(sim.stats,summ.stats))





