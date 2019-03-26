library(germinationmetrics)


### Name: t50
### Title: Median germination time
### Aliases: t50

### ** Examples

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
t50(germ.counts = x, intervals = int, method = "coolbear")
t50(germ.counts = x, intervals = int, method = "farooq")

# From cumulative germination counts
#----------------------------------------------------------------------------
t50(germ.counts = y, intervals = int, partial = FALSE, method = "coolbear")
t50(germ.counts = y, intervals = int, partial = FALSE, method = "farooq")




