## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width  = 7,
  fig.height = 5
)
rm(list=ls())

## ------------------------------------------------------------------------
library(rtrim)
data(skylark)
head(skylark,3) # inspect the dataset

## ------------------------------------------------------------------------
m1 <- trim(count ~ site + time, data=skylark, model=2)

## ------------------------------------------------------------------------
m1 <- trim(skylark, count_col="count", site_col="site", year_col="time", model=2)

## ------------------------------------------------------------------------
summary(m1) # summarize the model

## ------------------------------------------------------------------------
totals(m1) # Return time-totals

## ------------------------------------------------------------------------
gof(m1) # Retrieve goodness-of-fit

## ------------------------------------------------------------------------
coefficients(m1) # Extract the coefficients

## ------------------------------------------------------------------------
plot(overall(m1)) # Plot with overall slope

## ------------------------------------------------------------------------
m2 <- trim(count ~ site + time + Habitat, data=skylark, model=2)

## ------------------------------------------------------------------------
m3 <- trim(count ~ site + time + Habitat, data=skylark, model=2
     , overdisp = TRUE, serialcor = TRUE, changepoints=1:7, autodelete=TRUE)
m3$changepoints

## ------------------------------------------------------------------------
m4 <- trim(count ~ site + time + Habitat, data=skylark, model=2
     , overdisp = TRUE, serialcor = TRUE, changepoints=1:7, stepwise = TRUE)
m4$changepoints

## ------------------------------------------------------------------------
library(rtrim)
tmp <- "FILE skylark.dat
TITLE  skylark-1d
NTIMES 8
NCOVARS 2
LABELS
Habitat
Cov2
END
MISSING 999
WEIGHT Absent
COMMENT Example 1; using linear trend model
WEIGHTING off
OVERDISP on
SERIALCOR on
MODEL 2
"
write(tmp,file="skylark.tcf")
data(skylark)
skylark[is.na(skylark)] <- 999
write.table(skylark,file="skylark.dat",col.names=FALSE,row.names=FALSE)

## ------------------------------------------------------------------------
tc <- read_tcf("skylark.tcf")
m <- trim(tc)

## ------------------------------------------------------------------------
wald(m)

## ------------------------------------------------------------------------
tc

## ------------------------------------------------------------------------
data(skylark)
count_summary(skylark)


## ------------------------------------------------------------------------
check_observations(skylark, model=2, year_col="time", changepoints=c(1,4))

