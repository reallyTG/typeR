library(ANOM)


### Name: ANOM
### Title: ANOM Decision Charts
### Aliases: ANOM
### Keywords: ~dplot

### ** Examples
## No test: 
###############################################
### Standard ANOM (Gaussian, homoscedastic) ###
###############################################

### Devices of which brand filter bacteria significantly worse?
head(waterfilter)
str(waterfilter)

library(multcomp)
model <- lm(colonies ~ brand, waterfilter)
hom <- glht(model, mcp(brand="GrandMean"), alternative="less")
ANOM(hom)

############################
### Heteroscedastic ANOM ###
############################

## With sandwich covariance matrix estimate (Herberich et al. 2010)

library(multcomp)
library(sandwich)
het1 <- glht(model, mcp(brand="GrandMean"), alternative="less", vcov=vcovHC)
ANOM(het1)

## With multiple degrees of freedom (Hasler and Hothorn 2008)

library(SimComp)
het2 <- SimCiDiff(data=waterfilter, grp="brand", resp="colonies",
                  type="GrandMean", alternative="less", covar.equal=FALSE)
het2p <- SimTestDiff(data=waterfilter, grp="brand", resp="colonies",
                     type="GrandMean", alternative="less", covar.equal=FALSE)
ANOM(het2, stdep=waterfilter$colonies, stind=waterfilter$brand, pst=het2p)

#######################
### ANOM for ratios ###
#######################

## Homoscedastic

library(SimComp)
rel <- SimCiRat(data=waterfilter, grp="brand", resp="colonies",
                type="GrandMean", alternative="less", covar.equal=TRUE)
relp <- SimTestRat(data=waterfilter, grp="brand", resp="colonies",
                   type="GrandMean", alternative="less", covar.equal=TRUE)
ANOM(rel, stdep=waterfilter$colonies, stind=waterfilter$brand, pst=relp)

## Heteroscedastic (with multiple degrees of freedom)

library(SimComp)
relh <- SimCiRat(data=waterfilter, grp="brand", resp="colonies",
                 type="GrandMean", alternative="less", covar.equal=FALSE)
relhp <- SimTestRat(data=waterfilter, grp="brand", resp="colonies",
                    type="GrandMean", alternative="less", covar.equal=FALSE)
ANOM(relh, stdep=waterfilter$colonies, stind=waterfilter$brand, pst=relhp)

##########################
### Nonparametric ANOM ###
##########################

# Compute sample sizes per group
ss <- tapply(waterfilter$colonies, waterfilter$brand, length)
# Build a grand-mean-type contrast matrix
library(multcomp)
Mat <- contrMat(ss, "GrandMean")

## Using a multivariate t approximation

library(nparcomp)
mult <- mctp(colonies ~ brand, data=waterfilter, type="UserDefined",
             contrast.matrix=Mat, alternative="less", info=FALSE,
             correlation=TRUE, asy.method="mult.t")
ANOM(mult)
           
## Using a range-preserving Fisher transform

library(nparcomp)
fish <- mctp(colonies ~ brand, data=waterfilter, type="UserDefined",
             contrast.matrix=Mat, alternative="less", info=FALSE,
             correlation=TRUE, asy.method="fisher")
ANOM(fish)

#####################################
### ANOM for binomial proportions ###
#####################################

### Which schools' math achievements differ from the grand mean?

head(math)
str(math)

## Based on Wald-type confidence intervals

library(MCPAN)
wald <- binomRDci(n=math$enrolled, x=math$proficient, names=math$school,
                  alternative="two.sided", method="Wald", type="GrandMean")
waldp <- binomRDtest(n=math$enrolled, x=math$proficient, names=math$school,
                     alternative="two.sided", method="Wald", type="GrandMean")
ANOM(wald, pbin=waldp)

## Based on add-2 confidence intervals

library(MCPAN)
add2 <- binomRDci(n=math$enrolled, x=math$proficient, names=math$school,
                  alternative="two.sided", method="ADD2", type="GrandMean")
add2p <- binomRDtest(n=math$enrolled, x=math$proficient, names=math$school,
                     alternative="two.sided", method="ADD2", type="GrandMean")
ANOM(add2, pbin=add2p)

##########################
### ANOM for variances ###
##########################

### Springs of which brand are significantly more variable?

head(spring)
str(spring)

# Compute the median weight per brand
spring$median <- tapply(spring$weight, spring$brand, median)[spring$brand]
# Compute the absolute deviations from the median (robust Levene residuals)
spring$absdev <- with(spring, abs(weight - median))

library(multcomp)
mod <- lm(absdev ~ brand, spring)
test <- glht(mod, mcp(brand="GrandMean"))
ANOM(test)
## End(No test)


