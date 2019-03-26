library(rlme)


### Name: rpr
### Title: Cluster and Subcluster effects
### Aliases: rpr

### ** Examples


# Load school data
data(schools)

# Fit fixed effects model with lmr
lmr.fit = lmr(y ~ age + sex, data=schools)

# Three level design
# Partition residuals into school and region effects with rpp algorithm
rpr(y ~ age + sex + (1 | school) + (1 | school:region), lmr.fit$ehat, schools)

# Two level design
# Estimate variance in residuals from school
rpr(y ~ age + sex + (1 | school), lmr.fit$ehat, schools)




