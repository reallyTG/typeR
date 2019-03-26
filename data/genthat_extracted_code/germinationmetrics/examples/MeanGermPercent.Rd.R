library(germinationmetrics)


### Name: MeanGermPercent
### Title: Mean germination percentage and number of seeds per time
###   interval
### Aliases: MeanGermPercent MeanGermNumber

### ** Examples

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
MeanGermPercent(germ.counts = x, total.seeds = 50, intervals = int)
MeanGermNumber(germ.counts = x, intervals = int)

# From cumulative germination counts
#----------------------------------------------------------------------------
MeanGermPercent(germ.counts = y, total.seeds = 50, intervals = int, partial = FALSE)
MeanGermNumber(germ.counts = y, intervals = int, partial = FALSE)

# From number of germinated seeds
#----------------------------------------------------------------------------
MeanGermPercent(germinated.seeds = 40, total.seeds = 50, intervals = int)




