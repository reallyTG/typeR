library(KarsTS)


### Name: findTwins
### Title: findTwins: finds twin points in a recurrence matrix
### Aliases: findTwins
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Generate time series and recurrence matrix
res <- genRmExample(name = "SRM", InKTSEnv = FALSE, plotRM = FALSE)
TS <- res$TS
SRM <- res$newSimpRM

# Find twins
SRMTwins <- findTwins(SRM)

# Interpretation example
aFamily <- SRMTwins[which(is.finite(SRMTwins))][1]
twinsInFamily <- which(SRMTwins == aFamily)
TS[twinsInFamily,] 
# The values in TS are very similar
# The columns in the recurrence matrix are identical,
# although this cannot be observed directly
# because of the way KarsTS stores recurrence matrices



