library(anchors)


### Name: anchors.data
### Title: Organized data from surveys with anchoring vignettes
### Aliases: anchors.data
### Keywords: models

### ** Examples

## load data and make a copy
data(mexchn)
dta <- mexchn

## insert missing values into covariates for the purpose of this demonstration
dta <- replace.value( dta, "educyrs", from=1:9  , to = NA)
dta <- replace.value( dta, "age"    , from=30:40, to = NA)

## formula that will be used throughout
fo <- list(self = xsayself ~ male + educyrs,
           vign = cbind(xsay3, xsay1) ~ 1,
           tau  = ~ educyrs)

## 'C' uses only cases with no missing responses (self, vign)
a1 <- anchors( fo, dta, method="C")
## number of cases used:
##  y0 = number of cases with self-responses
##  z0 = number of cases with all vignette responses
unlist(lapply(a1$data, NROW))[1:2]

## 'chopit' keeps case with some missing responses
##  but drops others with missing covariates
a2 <- chopit( fo, dta)
## number of cases used:
##  y0 = number of cases with self-responses
##       AND no missing covariates
##  z0 = number of cases with AT LEAST ONE vignette response
##       and no missing covariates
unlist(lapply(a2$data, NROW))[1:2]

## with ' delete = "maximal" '
## both procedures use the exact same cases 
## (IF the same formula is used for both methods)

## y0 and z0 here
a3 <- anchors( fo, dta, method="C", anchors.options(delete="maximal"))
unlist(lapply(a3$data, NROW))[1:2]

## is the same as y0 and z0 for chopit:
a4 <- chopit( fo, dta, options=anchors.options(delete="maximal"))
unlist(lapply(a4$data, NROW))[1:2]




