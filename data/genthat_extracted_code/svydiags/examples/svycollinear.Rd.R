library(svydiags)


### Name: svycollinear
### Title: Condition indexes and variance decompositions in linear models
###   fitted with complex survey data
### Aliases: svycollinear
### Keywords: methods survey

### ** Examples

require(survey)
    # example from svyglm help page
data(api)
dstrat <- svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
m1 <- svyglm(api00~ell+meals+mobility, design=dstrat)
    # send model object from svyglm
CI.out <- svycollinear(mod = m1, w=apistrat$pw, Vcov=vcov(m1), sc=TRUE, svyglm.obj=TRUE,
        rnd=3, fuzz= 0.3)

    # send model matrix from svyglm
svycollinear(mod = m1$model, w=apistrat$pw, Vcov=vcov(m1), sc=TRUE, svyglm.obj=TRUE,
        rnd=3, fuzz=0.3)

    # use model.matrix to create matrix of covariates in model
data(nhanes2007)
newPSU <- paste(nhanes2007$SDMVSTRA, nhanes2007$SDMVPSU, sep=".")
nhanes.dsgn <- svydesign(ids = ~newPSU,
                         strata = NULL,
                         weights = ~WTDRD1, data=nhanes2007)
m1 <- svyglm(BMXWT ~ RIDAGEYR + as.factor(RIDRETH1) + DR1TKCAL +
    DR1TTFAT + DR1TMFAT + DR1TSFAT + DR1TPFAT, design=nhanes.dsgn)
X <- model.matrix(~ RIDAGEYR + as.factor(RIDRETH1) + DR1TKCAL + DR1TTFAT + DR1TMFAT
            + DR1TSFAT + DR1TPFAT,
        data = data.frame(nhanes2007))
CI.out <- svycollinear(mod = X, w=nhanes2007$WTDRD1, Vcov=vcov(m1), sc=TRUE, svyglm.obj=FALSE,
        rnd=2, fuzz=0.3)        



