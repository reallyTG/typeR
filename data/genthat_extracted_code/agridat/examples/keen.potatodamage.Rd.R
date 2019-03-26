library(agridat)


### Name: keen.potatodamage
### Title: Damage to potato tubers from lifting rods.
### Aliases: keen.potatodamage
### Keywords: datasets

### ** Examples


data(keen.potatodamage)
dat <- keen.potatodamage

# Energy E1, Rod R4, Weight W1 have higher proportions of severe damage
# Rod 8 has the least damage
d2 <- xtabs(count~energy+rod+gen+weight+damage, data=dat)
mosaicplot(d2, color=c("lemonchiffon1","moccasin","lightsalmon1","indianred"),
           xlab="Energy / Genotype", ylab="Rod / Weight", main="keen.potatodamage")

## Not run: 
##D   # Not run because it CRAN prefers examples faster than 5 seconds.
##D   require(ordinal)
##D   # Note, the clmm2 function can have only 1 random term.  Results are
##D   # similar to Keen & Engle, but necessarily different (they had multiple
##D   # random terms).
##D   m1 <- clmm2(damage ~ rod + energy + gen + weight, data=dat,
##D               weights=count, random=rod:energy, link='probit')
##D   round(coef(m1)[4:10],2)
##D   ## rodR2 rodR3 rodR4 rodR5 rodR6 rodR7 rodR8
##D   ## -1.19 -0.41  0.50 -1.46 -1.73 -1.67 -1.99
##D 
##D   # Alternative
##D   # m2 <- clmm(damage ~ rod + energy + gen + weight +
##D   #          (1|rod:energy), data=dat, weights=count, link='probit')
##D 
## End(Not run)





