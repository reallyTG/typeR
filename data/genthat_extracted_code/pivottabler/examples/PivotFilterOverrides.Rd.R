library(pivottabler)


### Name: PivotFilterOverrides
### Title: A class that defines a set of filter overrides
### Aliases: PivotFilterOverrides
### Keywords: datasets

### ** Examples

pt <- PivotTable$new()
# ...
# PivotFilterOverrides constructor allows a filter to be defined
# e.g. to enable %of row or column type calculations
filterOverrides <- PivotFilterOverrides$new(pt, keepOnlyFiltersFor="Volume")
# Alternatively/in addition, create a new filter
filter <- PivotFilter$new(pt, variableName="Country", values="England")
# Add the filter to the set of overrides
filterOverrides$add(filter=filter, action="replace")



