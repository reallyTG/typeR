library(germinationmetrics)


### Name: TimsonsIndex
### Title: Timson's index
### Aliases: TimsonsIndex GermRateGeorge

### ** Examples

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
# Wihout max specified
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50)
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             modification = "none")
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             modification = "labouriau")
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             modification = "khanungar")
# With max specified
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50, max = 10)
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             max = 10, modification = "none")
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             max = 10, modification = "labouriau")
TimsonsIndex(germ.counts = x, intervals = int, total.seeds = 50,
             max = 10, modification = "khanungar")

# Wihout max specified
GermRateGeorge(germ.counts = x, intervals = int)
# With max specified
GermRateGeorge(germ.counts = x, intervals = int, max = 10)
GermRateGeorge(germ.counts = x, intervals = int, max = 14)

# From cumulative germination counts
#----------------------------------------------------------------------------


# Wihout max specified
GermRateGeorge(germ.counts = x, intervals = int, partial = TRUE)
# With max specified
GermRateGeorge(germ.counts = x, intervals = int, partial = TRUE, max = 10)
GermRateGeorge(germ.counts = x, intervals = int, partial = TRUE, max = 14)



