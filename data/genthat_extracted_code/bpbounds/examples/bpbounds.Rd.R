library(bpbounds)


### Name: bpbounds
### Title: Nonparametric Bounds for the Average Causal Effect due to Balke
###   and Pearl.
### Aliases: bpbounds

### ** Examples

## No test: 
# Vitamin A example, using cell counts

require(tidyr)
require(bpbounds)

tab1dat <- data.frame(
  z = c(0, 0, 1, 1, 1, 1, 0, 0),
  x = c(0, 0, 0, 0, 1, 1, 1, 1),
  y = c(0, 1, 0, 1, 0, 1, 0, 1),
  freq = c(74, 11514, 34, 2385, 12, 9663, 0, 0)
)

tab1inddat = uncount(tab1dat, freq)
xt = xtabs(~ x + y + z, data = tab1inddat)
p = prop.table(xt, margin = 3)
bpres = bpbounds(p)
sbpres = summary(bpres)
print(sbpres)
## End(No test)

## No test: 
# Vitamin A example, using conditional probabilities

require(bpbounds)
cp = c(.0064, 0, .9936, 0, .0028, .001, .1972, .799)
tabp = as.table(array(
  cp,
  dim = c(2, 2, 2),
  dimnames = list(
    x = c(0, 1),
    y = c(0, 1),
    z = c(0, 1)
  )
))
bpbounds(tabp)
## End(No test)




