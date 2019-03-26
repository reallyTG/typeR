library(robustbase)


### Name: biomassTill
### Title: Biomass Tillage Data
### Aliases: biomassTill
### Keywords: datasets

### ** Examples

data(biomassTill)
str(biomassTill)
require(lattice)
## With long tailed errors
xyplot(Biomass ~ DVS | Tillage, data = biomassTill, type=c("p","smooth"))
## With additional 2 outliers:
xyplot(Biom.2 ~ DVS | Tillage, data = biomassTill, type=c("p","smooth"))

### Fit nonlinear Regression models: -----------------------------------

## simple starting values, needed:
m00st <- list(Wm = rep(300,  3),
               a = rep( 1.5, 3),
               b = rep( 2.2, 3))

robm <- nlrob(Biomass ~ Wm[Tillage] * (-expm1(-(DVS/a[Tillage])^b[Tillage])),
              data = biomassTill, start = m00st, maxit = 200)
##                                               -----------
summary(robm) ## ... 103 IRWLS iterations
plot(sort(robm$rweights), log = "y",
     main = "ordered robustness weights (log scale)")
mtext(getCall(robm))

## the classical (only works for the mild outliers):
cl.m <- nls(Biomass ~ Wm[Tillage] * (-expm1(-(DVS/a[Tillage])^b[Tillage])),
            data = biomassTill, start = m00st)

## now for the extra-outlier data: -- fails with singular gradient !!
try(
rob2 <- nlrob(Biom.2 ~ Wm[Tillage] * (-expm1(-(DVS/a[Tillage])^b[Tillage])),
              data = biomassTill, start = m00st)
)
## use better starting values:
m1st <- setNames(as.list(as.data.frame(matrix(
                coef(robm), 3))),
                c("Wm", "a","b"))
try(# just breaks a bit later!
rob2 <- nlrob(Biom.2 ~ Wm[Tillage] * (-expm1(-(DVS/a[Tillage])^b[Tillage])),
              data = biomassTill, start = m1st, maxit= 200, trace=TRUE)
)

## Comparison  {more to come} % once we have  "MM" working...
rbind(start = unlist(m00st),
      class = coef(cl.m),
      rob   = coef(robm))



