library(semTools)


### Name: auxiliary
### Title: Implement Saturated Correlates with FIML
### Aliases: auxiliary lavaan.auxiliary cfa.auxiliary sem.auxiliary
###   growth.auxiliary

### ** Examples

dat1 <- lavaan::HolzingerSwineford1939
set.seed(12345)
dat1$z <- rnorm(nrow(dat1))
dat1$x5 <- ifelse(dat1$z < quantile(dat1$z, .3), NA, dat1$x5)
dat1$x9 <- ifelse(dat1$z > quantile(dat1$z, .8), NA, dat1$x9)

targetModel <- "
  visual  =~ x1 + x2 + x3
  textual =~ x4 + x5 + x6
  speed   =~ x7 + x8 + x9
"

## works just like cfa(), but with an extra "aux" argument
fitaux1 <- cfa.auxiliary(targetModel, data = dat1, aux = "z",
                         missing = "fiml", estimator = "mlr")

## with multiple auxiliary variables and multiple groups
fitaux2 <- cfa.auxiliary(targetModel, data = dat1, aux = c("z","ageyr","grade"),
                         group = "school", group.equal = "loadings")

## calculate correct incremental fit indices (e.g., CFI, TLI)
fitMeasures(fitaux2, fit.measures = c("cfi","tli"))
## NOTE: lavaan will use the internally stored baseline model, which
##       is the independence model plus saturated auxiliary parameters
lavInspect(fitaux2@external$baseline.model, "free")




