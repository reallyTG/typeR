library(PROscorer)


### Name: narcc
### Title: Score the Cognitive Causation (CC) and Negative Affect in Risk
###   (NAR) scales
### Aliases: narcc

### ** Examples

# Make fake data for the example
nardat <- PROscorerTools::makeFakeData(nitems = 6, values = 0:3,
                                       propmiss = 0.40, prefix = "nar")
ccdat <- PROscorerTools::makeFakeData(nitems = 7, values = 0:3,
                                      propmiss = 0.40, prefix = "cc",
                                      id = TRUE)

# The nardat data frame contains ONLY NAR items, so can omit "items" argument
narcc(nardat, whichScale = "NAR")

# The ccdat data frame contains an "ID" variable, so need to use "items" arg
names(ccdat)

# The "items" argument can be either:
#     (1) the numeric vector indexing the location of the items in df, or
#     (2) a character vector of the item names
narcc(ccdat, items = 2:8, whichScale = "CC")

cc_names <- c("cc1", "cc2", "cc3", "cc4", "cc5", "cc6", "cc7")
narcc(ccdat, items = cc_names, whichScale = "CC")



