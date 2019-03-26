library(plm)


### Name: is.pbalanced
### Title: Check if data are balanced
### Aliases: is.pbalanced is.pbalanced.data.frame is.pbalanced.pdata.frame
###   is.pbalanced.pseries is.pbalanced.panelmodel is.pbalanced.pgmm
###   is.pbalanced.default
### Keywords: attribute

### ** Examples

# take balanced data and make it unbalanced
# by deletion of 2nd row (2nd time period for first individual)
data("Grunfeld", package = "plm")
Grunfeld_missing_period <- Grunfeld[-2, ]
is.pbalanced(Grunfeld_missing_period)     # check if balanced: FALSE
pdim(Grunfeld_missing_period)$balanced    # same

# pdata.frame interface
pGrunfeld_missing_period <- pdata.frame(Grunfeld_missing_period)
is.pbalanced(Grunfeld_missing_period)

# pseries interface
is.pbalanced(pGrunfeld_missing_period$inv)



