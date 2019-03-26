library(partykit)


### Name: HuntingSpiders
### Title: Abundance of Hunting Spiders
### Aliases: HuntingSpiders
### Keywords: datasets

### ** Examples

## load data
data("HuntingSpiders", package = "partykit")

## fit multivariate tree for 12-dimensional species abundance
sptree <- ctree(arct.lute + pard.lugu + zora.spin + pard.nigr + pard.pull +
  aulo.albi + troc.terr + alop.cune + pard.mont + alop.acce + alop.fabr +
  arct.peri ~ herbs + reft + moss + sand + twigs + water, data = HuntingSpiders,
  teststat = "max", minsplit = 5)
plot(sptree, terminal_panel = node_barplot)



