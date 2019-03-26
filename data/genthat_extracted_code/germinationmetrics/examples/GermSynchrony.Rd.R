library(germinationmetrics)


### Name: GermSynchrony
### Title: Synchrony and uncertainty of germination
### Aliases: GermSynchrony GermUncertainty

### ** Examples

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
GermSynchrony(germ.counts = x, intervals = int)
GermUncertainty(germ.counts = x, intervals = int)

# From cumulative germination counts
#----------------------------------------------------------------------------
GermSynchrony(germ.counts = y, intervals = int, partial = FALSE)
GermUncertainty(germ.counts = y, intervals = int, partial = FALSE)




