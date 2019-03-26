## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
load(file="../data/maude.rda")
load(file="../data/sales.rda")
library(mds)

## ------------------------------------------------------------------------
library(mds)
dim(maude)
dim(sales)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(maude, 3))

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(sales, 3))

## ------------------------------------------------------------------------
# Step 1 - Device Events
de <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name", "device_class"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")

# Step 2 - Exposures (Optional step)
ex <- exposure(
  sales,
  time="sales_month",
  device_hierarchy="device_name",
  match_levels="region",
  count="sales_volume")

# Step 3 - Define Analyses
da <- define_analyses(
  de,
  device_level="device_name",
  exposure=ex,
  covariates="region")

# Step 4 - Time Series
ts <- time_series(
  da,
  deviceevents=de,
  exposure=ex)

## ------------------------------------------------------------------------
summary(da)

## ------------------------------------------------------------------------
dadf <- define_analyses_dataframe(da)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(dadf, 3))

## ---- fig.show='hold'----------------------------------------------------
plot(ts[[1]])
plot(ts[[4]], "rate", type='l')

## ------------------------------------------------------------------------
de <- deviceevent(maude, "date_received", c("device_name", "device_class"), c("event_type", "medical_specialty_description"))

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(de, 3))

## ------------------------------------------------------------------------
de <- deviceevent(
  maude,
  time="date_received",
  device_hierarchy=c("device_name", "device_class"),
  event_hierarchy=c("event_type", "medical_specialty_description"),
  key="report_number",
  covariates="region",
  descriptors="_all_")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(de, 3))

## ------------------------------------------------------------------------
ex <- exposure(sales, "sales_month", "device_name")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(ex, 3))

## ------------------------------------------------------------------------
ex <- exposure(
  sales,
  time="sales_month",
  device_hierarchy="device_name",
  match_levels="region",
  count="sales_volume")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(ex, 3))

## ------------------------------------------------------------------------
da <- define_analyses(de, "device_name")

## ------------------------------------------------------------------------
summary(da)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(define_analyses_dataframe(da), 3))

## ------------------------------------------------------------------------
da <- define_analyses(
  de,
  device_level="device_name",
  exposure=ex,
  covariates="region")

## ------------------------------------------------------------------------
summary(da)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(define_analyses_dataframe(da), 3))

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(define_analyses_dataframe(da)[c(11:12, 32), ])

## ------------------------------------------------------------------------
ts <- time_series(da, de)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(ts[[1]], 3))

## ------------------------------------------------------------------------
ts <- time_series(
  da,
  deviceevents=de,
  exposure=ex)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(ts[[1]], 3))

## ------------------------------------------------------------------------
plot(ts[[1]])

