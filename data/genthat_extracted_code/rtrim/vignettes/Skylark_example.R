## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width  = 7,
  fig.height = 5
)

## ------------------------------------------------------------------------
rm(list=ls())
library(rtrim)
data(skylark2) # use extended version of the Skylark dataset
summary(skylark2)

## ------------------------------------------------------------------------
idx <- which(names(skylark2)=="year")      # rename year->season
names(skylark2)[idx] <- "season"
count_summary(skylark2, year_col="season") # show that it works
names(skylark2)[idx] <- "year"             # revert to original name

## ------------------------------------------------------------------------
z1 <- trim(count ~ site + year, data=skylark2, model=3, serialcor=TRUE, overdisp=TRUE)
summary(z1)
plot(overall(z1))

## ------------------------------------------------------------------------
z2 <- trim(count ~ site + year + habitat, data=skylark2, model=3, serialcor=TRUE, overdisp=TRUE)
summary(z2)

## ------------------------------------------------------------------------
z3 <- trim(count ~ site + year + habitat, data=skylark2, model=2, changepoints="all",
           serialcor=TRUE, overdisp=TRUE)
summary(z3)

## ------------------------------------------------------------------------
wald(z3)

## ------------------------------------------------------------------------
z4 <- trim(count ~ site + year + habitat, data=skylark2, model=2, changepoints="all",
           stepwise=TRUE, serialcor=TRUE, overdisp=TRUE)
summary(z4)
wald(z4)

## ------------------------------------------------------------------------
gof(z3)
LR3 <- gof(z3)$LR$LR # Get raw LR info for run 4
df3 <- gof(z3)$LR$df

gof(z4)
LR4 <- gof(z4)$LR$LR # idem for run 3
df4 <- gof(z4)$LR$df

# Test the differece by using the fact that the difference of two LR measures is
# asymptotically Chi^2 distributed
LR <- abs(LR4 - LR3)
df <- abs(df4 - df3)
p  <- 1 - pchisq(LR, df=df) # Use Chi-squared distribution
p

## ------------------------------------------------------------------------
index(z4, which="both")

## ------------------------------------------------------------------------
plot(index(z4))

## ------------------------------------------------------------------------
index(z4, which="both", covars=TRUE)

## ------------------------------------------------------------------------
plot(index(z4,which="fitted",covars=TRUE))

## ------------------------------------------------------------------------
check_observations(skylark2, model=3, covars=c("habitat","deposition"))

## ------------------------------------------------------------------------
z5 <- trim(count ~ site + year + habitat+deposition, data=skylark2, model=2,
           serialcor=TRUE, overdisp=TRUE)
summary(z5)
wald(z5)

## ------------------------------------------------------------------------
z6 <- trim(count ~ site + year + habitat, data=skylark2, model=2, changepoints="auto",
           serialcor=TRUE, overdisp=TRUE, weights="weight")
idx = index(z6, "fitted", covars=TRUE)
plot(idx)

