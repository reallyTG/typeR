library(zCompositions)


### Name: lcTest
### Title: Log-contrast homogeneity test
### Aliases: lcTest

### ** Examples

data(Water)
zPatterns(Water, label = 0)

# Test of homogeneity in log-contrast Potassium/Arsenic*Calcium
lcTest(Water, label = 0, lc = c(1,-1,-1,0))



