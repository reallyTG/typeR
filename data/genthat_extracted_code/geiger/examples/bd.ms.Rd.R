library(geiger)


### Name: bd.ms
### Title: estimate net diversification rate
### Aliases: bd.ms bd.km stem.p crown.p crown.limits stem.limits
### Keywords: arith

### ** Examples



geo=get(data(geospiza))

# Assuming no extinction
bd.ms(phy=geo$phy, missing=1, epsilon=0)

# Assuming high extinction
bd.ms(phy=geo$phy, missing=1, epsilon=0.9)





