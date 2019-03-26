library(nestedRanksTest)


### Name: plot.htest_boot
### Title: Diagnostic plot of result held in 'htest_boot' object
### Aliases: plot.htest_boot
### Keywords: hplot

### ** Examples

require(graphics)

data(woodpecker_multiyear)

## n.iter set to 1000 to shorten completion time
res.a <- nestedRanksTest(Distance ~ Year | Granary, n.iter = 1000,
                         data = woodpecker_multiyear,
                         subset = Species == "agrifolia")
res.l <- nestedRanksTest(Distance ~ Year | Granary, n.iter = 1000,
                         data = woodpecker_multiyear,
                         subset = Species == "lobata")

opa = par(mfrow = c(2, 1))
## Defaults
plot(res.l)
## Modify colours, line type and main title
plot(res.a, main = "Quercus agrifolia", col = "lightgreen",
     p.col = "brown4", p.lty = 1)
par(opa)



