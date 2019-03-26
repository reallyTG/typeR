library(elec)


### Name: make.sample
### Title: make.sample and friends
### Aliases: make.sample make.sample.from.totals
###   make.sample.from.totals.margin make.cartoon

### ** Examples

Z = make.sample(0.08, 150, per.winner=0.4)
Z

Z2 = make.sample(0.08, 150, per.winner=0.4, R=2.2)
Z2

## Note how they have different precinct sizes.

summary(Z$V$tot.votes)
summary(Z2$V$tot.votes)





