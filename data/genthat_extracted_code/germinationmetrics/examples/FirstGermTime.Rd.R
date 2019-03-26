library(germinationmetrics)


### Name: FirstGermTime
### Title: Time for first, last and peak germination
### Aliases: FirstGermTime LastGermTime PeakGermTime TimeSpreadGerm

### ** Examples

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
z <- c(0, 0, 0, 0, 11, 11, 9, 7, 1, 0, 1, 0, 0, 0)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
FirstGermTime(germ.counts = x, intervals = int)
LastGermTime(germ.counts = x, intervals = int)
TimeSpreadGerm(germ.counts = x, intervals = int)
PeakGermTime(germ.counts = x, intervals = int)
# For multiple peak germination times
PeakGermTime(germ.counts = z, intervals = int)

# From cumulative germination counts
#----------------------------------------------------------------------------
FirstGermTime(germ.counts = y, intervals = int, partial = FALSE)
LastGermTime(germ.counts = y, intervals = int, partial = FALSE)
TimeSpreadGerm(germ.counts = y, intervals = int, partial = FALSE)
PeakGermTime(germ.counts = y, intervals = int, partial = FALSE)
# For multiple peak germination time
PeakGermTime(germ.counts = cumsum(z), intervals = int, partial = FALSE)




