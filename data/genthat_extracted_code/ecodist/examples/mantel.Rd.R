library(ecodist)


### Name: mantel
### Title: Mantel test
### Aliases: mantel
### Keywords: multivariate

### ** Examples


data(graze)

grasses <- graze[, colnames(graze) %in% c("DAGL", "LOAR10", "LOPE", "POPR")]
legumes <- graze[, colnames(graze) %in% c("LOCO6", "TRPR2", "TRRE3")]

grasses.bc <- bcdist(grasses)
legumes.bc <- bcdist(legumes)

space.d <- dist(graze$sitelocation)
forest.d <- dist(graze$forestpct)

# Mantel test: is the difference in forest cover between sites
# related to the difference in grass composition between sites?
mantel(grasses.bc ~ forest.d)

# Mantel test: is the geographic distance between sites
# related to the difference in grass composition between sites?
mantel(grasses.bc ~ space.d)

# Partial Mantel test: is the difference in forest cover between sites
# related to the difference in grass composition once the
# linear effects of geographic distance are removed?
mantel(grasses.bc ~ forest.d + space.d)


# Mantel test: is the difference in forest cover between sites
# related to the difference in legume composition between sites?
mantel(legumes.bc ~ forest.d)

# Mantel test: is the geographic distance between sites
# related to the difference in legume composition between sites?
mantel(legumes.bc ~ space.d)

# Partial Mantel test: is the difference in forest cover between sites
# related to the difference in legume composition once the
# linear effects of geographic distance are removed?
mantel(legumes.bc ~ forest.d + space.d)


# Is there nonlinear pattern in the relationship with geographic distance?
par(mfrow=c(2, 1))
plot(mgram(grasses.bc, space.d, nclass=8))
plot(mgram(legumes.bc, space.d, nclass=8))



