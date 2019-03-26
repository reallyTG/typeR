library(elec)


### Name: make.truth.x
### Title: make.truth.X
### Aliases: make.truth make.truth.opt.bad make.truth.ex.bad
###   make.truth.opt.bad.strat make.ok.truth

### ** Examples

## First make a fake election.
Z = make.sample(0.08, 150, per.winner=0.4, R=2.2)
Z

## Now make a fake truth, which has a lot of small errors:
Zb = make.ok.truth(Z, num.off=150, amount.off=5)
Zb

## Finally, make the hardest to detect (via SRS) ``wrong'' election:
Zw = make.truth.opt.bad( Z, t=4 )
Zw 



