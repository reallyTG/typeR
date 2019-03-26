library(pivottabler)


### Name: PivotFilters
### Title: A class that defines a set of filter conditions
### Aliases: PivotFilters
### Keywords: datasets

### ** Examples

pt <- PivotTable$new()
# ...
# PivotFilters constructor allows a filter to be defined
filters <- PivotFilters$new(pt, variableName="Year", values=2017)
# Create a new filter
filter <- PivotFilter$new(pt, variableName="Country", values="England")
# Combine the filters
filters$setFilter(filter)
# filters now contains criteria for both Year and Country
# Now add another filter, this time via an alternative method
filters$setFilterValues(variableName="Product", values="Cadbury Dairy Milk
Chocolate 100g")
# filters now contains criteria for Year, Country and Product



