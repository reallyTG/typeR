library(germinationmetrics)


### Name: MeanGermTime
### Title: Germination time
### Aliases: MeanGermTime VarGermTime SEGermTime CVGermTime

### ** Examples

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
MeanGermTime(germ.counts = x, intervals = int)
VarGermTime(germ.counts = x, intervals = int)
SEGermTime(germ.counts = x, intervals = int)
CVGermTime(germ.counts = x, intervals = int)

# From cumulative germination counts
#----------------------------------------------------------------------------
MeanGermTime(germ.counts = y, intervals = int, partial = FALSE)
VarGermTime(germ.counts = y, intervals = int, partial = FALSE)
SEGermTime(germ.counts = y, intervals = int, partial = FALSE)
CVGermTime(germ.counts = y, intervals = int, partial = FALSE)




