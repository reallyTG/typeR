library(svydiags)


### Name: Vmat
### Title: Compute covariance matrix of residuals for linear models fitted
###   with complex survey data
### Aliases: Vmat
### Keywords: methods survey

### ** Examples

require(Matrix)
require(survey)
data(nhanes2007)
black <- nhanes2007$RIDRETH1 == 4
X <- nhanes2007
X <-  cbind(X, black)
X1 <- X[order(X$SDMVSTRA, X$SDMVPSU),]

    # unstratified, unclustered design
nhanes.dsgn <- svydesign(ids = 1:nrow(X1),
                         strata = NULL,
                         weights = ~WTDRD1, data=X1)
m1 <- svyglm(BMXWT ~ RIDAGEYR + as.factor(black) + DR1TKCAL, design=nhanes.dsgn)
summary(m1)

V <- Vmat(mobj = m1,
          stvar = NULL,
          clvar = NULL)

    # stratified, clustered design
nhanes.dsgn <- svydesign(ids = ~SDMVPSU,
                         strata = ~SDMVSTRA,
                         weights = ~WTDRD1, nest=TRUE, data=X1)
m1 <- svyglm(BMXWT ~ RIDAGEYR + as.factor(black) + DR1TKCAL, design=nhanes.dsgn)
summary(m1)
V <- Vmat(mobj = m1,
          stvar = "SDMVSTRA",
          clvar = "SDMVPSU")



