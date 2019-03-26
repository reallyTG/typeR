library(climextRemes)


### Name: fit_pot
### Title: Fit a peaks-over-threshold model to exceedances over a threshold
### Aliases: fit_pot

### ** Examples

# setup Fort precipitation data
data(Fort, package = 'extRemes')
firstBlock <- min(Fort$year)
years <- min(Fort$year):max(Fort$year)
nYears <- length(years)
threshold <- 0.395
ord <- order(Fort$year, Fort$month, Fort$day) 
Fort <- Fort[ord, ]
ind <- Fort$Prec > threshold
FortExc <- Fort[ind, ]

# stationary fit
out <- fit_pot(FortExc$Prec, threshold = threshold, nBlocks = nYears, 
        returnPeriod = 20, returnValue = 3.5,
        getParams = TRUE, bootSE = FALSE)

# fit with location linear in year
out <- fit_pot(FortExc$Prec, x = data.frame(years = years), threshold = threshold,
        locationFun = ~years, nBlocks = nYears, 
        blockIndex = FortExc$year, firstBlock = firstBlock,
        returnPeriod = 20, returnValue = 3.5,
        getParams = TRUE, xNew = data.frame(years = range(Fort$year)), bootSE = FALSE)

# with declustering
index <- seq_len(nrow(Fort))
out <- fit_pot(FortExc$Prec, x = data.frame(years = years), threshold = threshold,
        locationFun = ~years, nBlocks = nYears, 
        blockIndex = FortExc$year, firstBlock = firstBlock, index = index[ind],
        returnPeriod = 20, returnValue = 3.5,
        getParams = TRUE, xNew = data.frame(years = range(Fort$year)),
        declustering = 'noruns', bootSE = FALSE)

# with replicates; for illustration here, I'll just duplicate the Fort data
Fort2x <- rbind(FortExc, FortExc)
n <- nrow(FortExc)
out <- fit_pot(Fort2x$Prec, x = data.frame(years = years), threshold = threshold,
        locationFun = ~years, nBlocks = nYears,
        blockIndex = Fort2x$year, firstBlock = firstBlock,
        nReplicates = 2, replicateIndex = c(rep(1, n), rep(2, n)),
        returnPeriod = 20, returnValue = 3.5,
        getParams = TRUE, xNew = data.frame(years = range(Fort$year)), bootSE = FALSE)

# analysis of seasonal total precipitation
FortSummer <- Fort[Fort$month %in% 6:8, ]  # summer precipitation
FortSummerSum <- aggregate(Prec ~ year, data = FortSummer, sum)
threshold <- quantile(FortSummerSum$Prec, 0.8)
FortSummerSumExc <- FortSummerSum[FortSummerSum$Prec > threshold, ]
# each year (single observation) treated as a block, so return probability
# can be interpreted as probability of exceeding a value in a single year
out <- fit_pot(FortSummerSumExc$Prec, x = data.frame(years = years), threshold = threshold,
        nBlocks = nYears, blockIndex = FortSummerSumExc$year, firstBlock = firstBlock,
        locationFun = ~years, returnPeriod = 20,
        returnValue = 10, getParams = TRUE, xNew = data.frame(years = range(Fort$year)),
        bootSE = FALSE)




