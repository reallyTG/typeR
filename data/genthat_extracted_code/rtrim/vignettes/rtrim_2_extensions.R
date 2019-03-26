## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width  = 7,
  fig.height = 5
)
rm(list=ls())

## ------------------------------------------------------------------------
rm(list=ls()) # always start with a clean slate
library(rtrim)
data(oystercatcher)
oc <- trim(count ~ site + (year+month), data=oystercatcher, model=3, overdisp=TRUE,
           constrain_overdisp=0.999)
plot(index(oc))

## ------------------------------------------------------------------------
load("UIndex_Oystercatcher_output.RData")
yrange <- range(uidx$index, uidx$lower, uidx$upper)
plot(uidx$year, uidx$index, type='l', xlab="Year", ylab="Index", ylim=yrange)
segments(uidx$year, uidx$lower, uidx$year,uidx$upper)
legend("topright", "UIndex", col="black", lty="solid")

# Add index=1 line for reference
abline(h=1.0, lty="dashed", col=gray(0.5))

# Mark the base year
ibase <- match(2004, uidx$year)
points(uidx$year[ibase], uidx$index[ibase], pch=16)

## ------------------------------------------------------------------------
# Compute and plot an index for Oystercatcher counts, using 2004 as base year and
# adding 90% confidence intervals as well.
idx <- index(oc, level=0.9, base=2004)
plot(idx, band="ci")

# Plot UIndex on top
lines(uidx$year, uidx$index)
segments(uidx$year, uidx$lower, uidx$year,uidx$upper, lwd=2)

legend("bottom", c("UIndex","TRIM"), col=c("black","red"), lty="solid")

## ------------------------------------------------------------------------
# split data
data(skylark2)
heath <- subset(skylark2, habitat=="heath") # 208 records
dunes <- subset(skylark2, habitat=="dunes") # 232 records

heath$site <- factor(heath$site) # get rid of empty levels
dunes$site <- factor(dunes$site)

# run models
m1 <- trim(count ~ site + year, data=heath, model=3)
m2 <- trim(count ~ site + year, data=dunes, model=3)

# collect imputed time-totals (which is the default)
t1 <- totals(m1)
t2 <- totals(m2)

plot(t1,t2, names=c("heath", "dunes"))

## ------------------------------------------------------------------------
t1$region <- "heath"
t2$region <- "dunes"
t12 <- rbind(t1, t2)
head(t12)

## ------------------------------------------------------------------------
# Also collect the variance-covariance matrices for both runs
vcv1 <- vcov(m1)
vcv2 <- vcov(m2)
vcv3 <- list(heath=vcv1, dunes=vcv2)

## ------------------------------------------------------------------------
m3 <- trim(imputed ~ region + time, data=t12, model=3, covin=vcv3)
plot(totals(m3))

## ------------------------------------------------------------------------
m0 <- trim(count ~ site + year + habitat, data=skylark2, model=3) # baseline
t0 <- totals(m0)
t3 <- totals(m3)
plot(t0,t3, names=c("baseline","superstrata"))

## ------------------------------------------------------------------------
data(oystercatcher)
m1 <- trim(count ~ site + (year + month), data=oystercatcher, model=3, overdisp=TRUE)
overdispersion(m1)

## ------------------------------------------------------------------------
m2 <- trim(count ~ site + (year + month), data=oystercatcher, model=3, overdisp=TRUE,
           constrain_overdisp=0.99)
overdispersion(m2)

## ------------------------------------------------------------------------
t1 <- totals(m1)
t2 <- totals(m2)
plot(t1, t2, names=c("unconstrained","constrained"), leg.pos="bottom")

## ------------------------------------------------------------------------
rm(list=ls())                          # New section; time for a new blank slate
data(skylark2)                                             # reload Skylark data
m1 <- trim(count ~ site + year, data=skylark2, model=3)
t1 <- totals(m1)          # By default, the time-totals for the imputed data set
plot(t1)

## ------------------------------------------------------------------------
m2 <- trim(count ~ site + year, data=skylark2, model=2, changepoints=c(1,2))
ti <- totals(m2, "imputed")
tf <- totals(m2, "fitted")
plot(ti, tf, names=c("imputed","fitted"), main="Skylark", leg.pos="bottomright")

## ------------------------------------------------------------------------
m3 <- trim(count ~ site + year, data=skylark2, model=3)
t3 <- totals(m3, obs=TRUE)          # Extract observations in addition to totals
plot(t3)

## ------------------------------------------------------------------------
m <- trim(count ~ site + year, data=skylark2, model=3) # Run a fairly basic TRIM model
idx <- index(m) # By default, the indices for the imputed data set
plot(idx)

## ------------------------------------------------------------------------
plot(idx, xlab="Year AD", ylab="Index (%)", main="Skylark index", pct=TRUE)

## ------------------------------------------------------------------------
m <- trim(count ~ site + year + habitat, data=skylark2, model=3) # Run a fairly basic TRIM model
idx <- index(m, covars=TRUE)
plot(idx)

## ------------------------------------------------------------------------
data(skylark2)
m0 = trim(count ~ site + year          , data=skylark2, model=3)
m1 = trim(count ~ site + year + habitat, data=skylark2, model=3)

idx0 <- index(m0)
idx1 <- index(m1)

plot(idx0, idx1)

## ------------------------------------------------------------------------
plot(idx0, idx1, names=c("Without covariates", "Using 'Habitat' as covariate"))

## ------------------------------------------------------------------------
m <- trim(count ~ site + year, data=skylark2, model=3)
tt <- totals(m, level=0.95)                   # Compute 95% confidence intervals
head(tt)

## ------------------------------------------------------------------------
plot(tt)

## ------------------------------------------------------------------------
plot(tt, band="ci")

## ------------------------------------------------------------------------
m <- trim(count ~ site + year, data=skylark2, model=3)
heatmap(m, main="Skylark, observations")

## ------------------------------------------------------------------------
heatmap(m, "fitted", main="Skylark, TRIM estimates")

## ------------------------------------------------------------------------
heatmap(m, "imputed", main="Skylark, imputed data")

## ------------------------------------------------------------------------
data(oystercatcher)
m <- trim(count ~ site + (year + month), data=oystercatcher, model=3, overdisp=TRUE)
heatmap(m, "imputed", main="Oystercatcher (imputed)")

