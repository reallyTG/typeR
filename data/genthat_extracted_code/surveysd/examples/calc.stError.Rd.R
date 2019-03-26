library(surveysd)


### Name: calc.stError
### Title: Calcualte point estimates and their standard errors using
###   bootstrap weights.
### Aliases: calc.stError
### Keywords: manip survey

### ** Examples

# Import data and calibrate

set.seed(1234)
eusilc <- demo.eusilc(n = 4,prettyNames = TRUE)
dat_boot <- draw.bootstrap(eusilc, REP = 3, hid = "hid", weights = "pWeight",
                           strata = "region", period = "year")
dat_boot_calib <- recalib(dat_boot, conP.var = "gender", conH.var = "region")

# estimate weightedRatio for povertyRisk per period

err.est <- calc.stError(dat_boot_calib, var = "povertyRisk", fun = weightedRatio)
err.est$Estimates

# calculate weightedRatio for povertyRisk and fraction of one-person households per period

dat_boot_calib[, onePerson := .N == 1, by = .(year, hid)]
err.est <- calc.stError(dat_boot_calib, var = c("povertyRisk", "onePerson"), fun = weightedRatio)
err.est$Estimates

# estimate weightedRatio for povertyRisk per period and gender

group <- "gender"
err.est <- calc.stError(dat_boot_calib, var = "povertyRisk", fun = weightedRatio, group = group)
err.est$Estimates

# estimate weightedRatio for povertyRisk per period and gender, region and combination of both

group <- list("gender", "region", c("gender", "region"))
err.est <- calc.stError(dat_boot_calib, var = "povertyRisk", fun = weightedRatio, group = group)
err.est$Estimates

# use average over 3 periods for standard error estimation

err.est <- calc.stError(dat_boot_calib, var = "povertyRisk", fun = weightedRatio, period.mean = 3)
err.est$Estimates

# get estimate for difference of period 2016 and 2013

period.diff <- c("2015-2011")
err.est <- calc.stError(dat_boot_calib, var = "povertyRisk", fun = weightedRatio,
                        period.diff = period.diff, period.mean = 3)
err.est$Estimates

# use add.arg-argument
fun <- function(x,w,b){
  sum(x*w*b)
}
add.arg = list(b="onePerson")

err.est <- calc.stError(dat_boot_calib, var = "povertyRisk", fun = fun,
                        period.mean = 0, add.arg=add.arg)
err.est$Estimates
# compare with direkt computation
compare.value <- dat_boot_calib[,fun(povertyRisk,pWeight,b=onePerson),by=c("year")]
all((compare.value$V1-err.est$Estimates$val_povertyRisk)==0)

# use a function from an other package that has sampling weights as its second argument
# for example gini() from laeken

library(laeken)

## set up help function that returns only the gini index
help_gini <- function(x, w){
 return(gini(x, w)$value)
}

## make sure povertyRisk get coerced to a numeric in order to work with the external functions
invisible(dat_boot_calib[, povertyRisk := as.numeric(povertyRisk)])

err.est <- calc.stError(dat_boot_calib, var = "povertyRisk", fun = help_gini, group = group,
                        period.diff = period.diff, period.mean = 3)
err.est$Estimates

# using fun.adjust.var and adjust.var to estimate povmd60 indicator
# for each period and bootstrap weight before applying the weightedRatio point estimate

# this function estimates the povmd60 indicator with x as income vector
# and w as weight vector
povmd <- function(x, w){
 md <- laeken::weightedMedian(x, w)*0.6
 pmd60 <- x < md
 return(as.integer(pmd60))
}

# set adjust.var="eqIncome" so the income vector ist used to estimate
# the povmd60 indicator for each bootstrap weight
# and the resultung indicators are passed to function weightedRatio

err.est <- calc.stError(dat_boot_calib, var = "povertyRisk", fun = weightedRatio,
                        group = group, fun.adjust.var = povmd, adjust.var = "eqIncome",
                        period.mean = 3)
err.est$Estimates

# why fun.adjust.var and adjust.var are needed (!!!):
# one could also use the following function
# and set fun.adjust.var=NULL,adjust.var=NULL
# and set fun = povmd, var = "eqIncome"

povmd2 <- function(x, w){
 md <- laeken::weightedMedian(x, w)*0.6
 pmd60 <- x < md
 # weighted ratio is directly estimated inside my function
 return(sum(w[pmd60])/sum(w)*100)
}

# but this results in different results in subgroups
# compared to using fun.adjust.var and adjust.var

err.est.different <- calc.stError(dat_boot_calib, var = "eqIncome", fun = povmd2,
                                  group = group, fun.adjust.var = NULL, adjust.var = NULL,
                                  period.mean = 3)
err.est.different$Estimates

## results are equal for yearly estimates
all.equal(err.est.different$Estimates[is.na(gender) & is.na(region)],
          err.est$Estimates[is.na(gender)&is.na(region)],
          check.attributes = FALSE)

## but for subgroups (gender, region) results vary
all.equal(err.est.different$Estimates[!(is.na(gender) & is.na(region))],
          err.est$Estimates[!(is.na(gender) & is.na(region))],
          check.attributes = FALSE)




