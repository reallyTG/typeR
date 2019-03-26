library(IsoriX)


### Name: prepsources
### Title: Filter and aggregate the raw source dataset
### Aliases: prepsources

### ** Examples

## Create a processed dataset for Germany
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

head(GNIPDataDEagg)

## Create a processed dataset for Germany per month
GNIPDataDEmonthly <-prepsources(data = GNIPDataDE,
                                split_by = "month")

head(GNIPDataDEmonthly)

## Create a processed dataset for Germany per year
GNIPDataDEyearly <- prepsources(data = GNIPDataDE,
                                split_by = "year")

head(GNIPDataDEyearly)

## Create isoscape-dataset for warm months in germany between 1995 and 1996
GNIPDataDEwarm <- prepsources(data = GNIPDataDE,
                              month = 5:8,
                              year = 1995:1996)

head(GNIPDataDEwarm)


## Create a dataset with 90% of obs
GNIPDataDE90pct <- prepsources(data = GNIPDataDE,
                               prop_random = 0.9,
                               random_level = "obs")

lapply(GNIPDataDE90pct, head) # show beginning of both datasets

## Create a dataset with half the weather sources
GNIPDataDE50pctsources <- prepsources(data = GNIPDataDE,
                                       prop_random = 0.5,
                                       random_level = "source")

lapply(GNIPDataDE50pctsources, head)


## Create a dataset with half the weather sources split per month
GNIPDataDE50pctsourcesMonthly <- prepsources(data = GNIPDataDE,
                                              split_by = "month",
                                              prop_random = 0.5,
                                              random_level = "source")

lapply(GNIPDataDE50pctsourcesMonthly, head)




