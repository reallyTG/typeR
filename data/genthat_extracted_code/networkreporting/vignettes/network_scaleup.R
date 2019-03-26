## ---- message=FALSE------------------------------------------------------
library(networkreporting)
library(surveybootstrap)

## column names for connections to hidden population numbers
hidden.q <- c("sex.workers", "msm", "idu", "clients")

## column names for connections to groups of known size
hm.q <- c("widower", "nurse.or.doctor", "male.community.health", "teacher", 
          "woman.smoke", "priest", "civil.servant", "woman.gave.birth", 
          "muslim", "incarcerated", "judge", "man.divorced", "treatedfortb", 
          "nsengimana", "murekatete", "twahirwa", "mukandekezi", "nsabimana", 
          "mukamana", "ndayambaje", "nyiraneza", "bizimana", "nyirahabimana", 
          "ndagijimana", "mukandayisenga", "died")

## size of the entire population
tot.pop.size <- 10718378


## ------------------------------------------------------------------------
example.knownpop.dat

## ------------------------------------------------------------------------
kp.vec <- df.to.kpvec(example.knownpop.dat, kp.var="known.popn", kp.value="size")

kp.vec

## ------------------------------------------------------------------------
# total size of the population
tot.pop.size <- 10e6

## ------------------------------------------------------------------------
head(example.survey)

## ------------------------------------------------------------------------
## make a vector with the list of known population names from
## our dataset of known population totals
known.popn.vars <- paste(example.knownpop.dat$known.popn)

## before topcoding: max. response for several popns is > 30
summary(example.survey[,known.popn.vars])

## ------------------------------------------------------------------------
example.survey <- topcode.data(example.survey,
                               vars=known.popn.vars,
                               max=30)

## after topcoding: max. response for all popns is 30
summary(example.survey[,known.popn.vars])

## ---- tidy=FALSE---------------------------------------------------------
d.hat <- kp.degree.estimator(survey.data=example.survey,
                             known.popns=kp.vec,
                             total.popn.size=tot.pop.size,
                             missing="complete.obs")

summary(d.hat)

## ---- message=FALSE------------------------------------------------------
library(ggplot2) # we'll use qplot from ggplot2 for plots
theme_set(theme_minimal())

## ------------------------------------------------------------------------
qplot(d.hat, binwidth=25)

## ------------------------------------------------------------------------
example.survey$d.hat <- d.hat

## ---- tidy=FALSE---------------------------------------------------------
idu.est <- nsum.estimator(survey.data=example.survey,
                          d.hat.vals=d.hat,
                          total.popn.size=tot.pop.size,
                          y.vals="idu",
                          missing="complete.obs")

## ------------------------------------------------------------------------
idu.est

## ---- tidy=FALSE---------------------------------------------------------
idu.est <- bootstrap.estimates(## this describes the sampling design of the
                               ## survey; here, the PSUs are given by the
                               ## variable cluster, and the strata are given
                               ## by the variable region
                               survey.design = ~ cluster + strata(region),
                               ## the number of bootstrap resamples to obtain
                               ## (NOTE: in practice, you should use more than 100.
                               ##  this keeps building the package relatively fast)
                               num.reps=100,
                               ## this is the name of the function
                               ## we want to use to produce an estimate
                               ## from each bootstrapped dataset
                               estimator.fn="nsum.estimator",
                               ## these are the sampling weights
                               weights="indweight",
                               ## this is the name of the type of bootstrap
                               ## we wish to use
                               bootstrap.fn="rescaled.bootstrap.sample",
                               ## our dataset
                               survey.data=example.survey,
                               ## other parameters we need to pass
                               ## to the nsum.estimator function
                               d.hat.vals=d.hat,
                               total.popn.size=tot.pop.size,
                               y.vals="idu",
                               missing="complete.obs")

## ------------------------------------------------------------------------
library(plyr)
## combine the estimates together in one data frame
## (bootstrap.estimates gives us a list)
all.idu.estimates <- ldply(idu.est,
                           function(x) { data.frame(estimate=x$estimate) })

## ------------------------------------------------------------------------
## look at a histogram of the results
qplot(all.idu.estimates$estimate, binwidth=50)

## summarize the results
summary(all.idu.estimates$estimate)

## ------------------------------------------------------------------------
quantile(all.idu.estimates$estimate, probs=c(0.025, 0.975))

## ---- tidy=FALSE---------------------------------------------------------
iv.result <- nsum.internal.validation(survey.data=example.survey,
                                      known.popns=kp.vec,
                                      missing="complete.obs",
                                      killworth.se=TRUE,
                                      total.popn.size=tot.pop.size,
                                      kp.method=TRUE,
                                      return.plot=TRUE)

## ------------------------------------------------------------------------
iv.result$results

## ------------------------------------------------------------------------
print(iv.result$plot)

## ------------------------------------------------------------------------
print(iv.result$plot + ggtitle("internal validation checks"))

## ------------------------------------------------------------------------
example.survey <- add.kp(example.survey, kp.vec, tot.pop.size)

d.hat.new <- kp.degree.estimator(survey.data=example.survey,
                                 # we don't need this anymore, since we
                                 # them to survey.data's attributes using add.kp
                                 #known.popns=kp.vec,
                                 #total.popn.size=tot.pop.size,
                                 missing="complete.obs")

summary(d.hat.new)

