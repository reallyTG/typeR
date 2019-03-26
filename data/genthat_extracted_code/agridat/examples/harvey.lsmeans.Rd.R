library(agridat)


### Name: harvey.lsmeans
### Title: Average daily gain of 65 steers for 3 lines, 9 sires.
### Aliases: harvey.lsmeans
### Keywords: datasets

### ** Examples


library(agridat)
data(harvey.lsmeans)
dat = harvey.lsmeans

require(lattice)
dotplot(adg ~ sire|line,dat,
        main="harvey.lsmeans", xlab="sire", ylab="average daily gain")

## Not run: 
##D   # Model suggested by Harvey on page 103
##D   m0 <- lm(adg ~ 1 + line + sire + damage + line:damage + weanage +
##D            weight, data=dat)
##D 
##D   # Due to contrast settings, it can be hard to compare model coefficients to Harvey,
##D   # but note the slopes of the continuous covariates match Harvey p. 107, where his
##D   # b is weanage, d is weight
##D   # coef(m0)
##D   #       weanage       weight 
##D   #  -0.008154879  0.001970446
##D   
##D   # A quick attempt to reproduce table 4 of Harvey, p. 109. Not right.
##D   # require(emmeans)
##D   # emmeans(m0,c('line','sire','damage'))
## End(Not run)




