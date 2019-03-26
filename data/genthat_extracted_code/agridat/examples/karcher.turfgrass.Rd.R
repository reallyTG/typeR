library(agridat)


### Name: karcher.turfgrass
### Title: Turfgrass ratings for different treatments
### Aliases: karcher.turfgrass
### Keywords: datasets

### ** Examples


data(karcher.turfgrass)
dat <- karcher.turfgrass

dat$rating <- ordered(dat$rating, levels=c('Poor','Average', 'Good','Excellent'))

ftable(xtabs(~manage+nitro+rating, dat)) # Table 6.19 of Schabenberger

# Probably would choose management M3, nitro N2
mosaicplot(xtabs(count ~ manage + rating + nitro, dat),
           shade=TRUE, dir=c('h','v','h'),
           main="karcher.turfgrass - turfgrass ratings")

# Multinomial logistic model.  Probit Ordered Logistic Regression.
require(MASS)
m1 <- polr(rating ~ nitro*manage + week, dat, weights=count, Hess=TRUE, method='logistic')
summary(m1)

# Try to match the "predicted marginal probability distribution" of
# Schabenberger table 6.20.  He doesn't define "marginal".
# Are the interaction terms included before aggregation?
# Are 'margins' calculated before/after back-transforming?
# At what level is the covariate 'week' included?

# Here is what Schabenberger presents:
##        M1   M2   M3   M4  |   N1  N2
## Poor  .668 .827 .001 .004 | .279 .020
## Avg   .330 .172 .297 .525 | .712 .826
## Good  .002 .001 .695 .008 | .008 .153
## Exc   .000 .000 .007 .003 | .001 .001

## We use week=3.5, include interactions, then average
newd <- expand.grid(manage=levels(dat$manage), nitro=levels(dat$nitro), week=3.5)
newd <- cbind(newd, predict(m1, newdata=newd, type='probs')) # probs)
print(aggregate( . ~ manage, data=newd, mean), digits=2)
##   manage nitro week   Poor Average    Good Excellent
## 1     M1   1.5  3.5 0.67      0.33 0.0011  0.0000023
## 2     M2   1.5  3.5 0.76      0.24 0.00059 0.0000012
## 3     M3   1.5  3.5 0.0023    0.48 0.52    0.0042
## 4     M4   1.5  3.5 0.0086    0.57 0.42    0.0035




