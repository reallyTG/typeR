library(miceadds)


### Name: mi.anova
### Title: Analysis of Variance for Multiply Imputed Data Sets (Using the
###   D_2 Statistic)
### Aliases: mi.anova
### Keywords: ANOVA mids

### ** Examples

#############################################################################
# EXAMPLE 1: nhanes2 data | two-way ANOVA
#############################################################################

library(mice)
library(car)
data(nhanes2, package="mice")
set.seed(9090)

# nhanes data in one chain and 8 imputed datasets
mi.res <- miceadds::mice.1chain( nhanes2, burnin=4, iter=20, Nimp=8 )
# 2-way analysis of variance (type 2)
an2a <- miceadds::mi.anova(mi.res=mi.res, formula="bmi ~ age * chl" )
# 2-way analysis of variance (type 3)
an2b <- miceadds::mi.anova(mi.res=mi.res, formula="bmi ~ age * chl", type=3)

#****** analysis based on first imputed dataset

# extract first dataset
dat1 <- mice::complete( mi.res$mids )

# type 2 ANOVA
lm1 <- stats::lm( bmi ~ age * chl, data=dat1 )
summary( stats::aov( lm1 ) )
# type 3 ANOVA
lm2 <- stats::lm( bmi ~ age * chl, data=dat1, contrasts=list(age=contr.sum))
car::Anova( lm2, type=3)



