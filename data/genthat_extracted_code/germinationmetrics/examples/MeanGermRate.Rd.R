library(germinationmetrics)


### Name: MeanGermRate
### Title: Germination rate
### Aliases: MeanGermRate CVG VarGermRate SEGermRate GermRateRecip

### ** Examples

x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
MeanGermRate(germ.counts = x, intervals = int)
CVG(germ.counts = x, intervals = int)
VarGermRate(germ.counts = x, intervals = int)
SEGermRate(germ.counts = x, intervals = int)
GermRateRecip(germ.counts = x, intervals = int, method = "coolbear")
GermRateRecip(germ.counts = x, intervals = int, method = "farooq")

# From cumulative germination counts
#----------------------------------------------------------------------------
MeanGermRate(germ.counts = y, intervals = int, partial = FALSE)
CVG(germ.counts = y, intervals = int, partial = FALSE)
VarGermRate(germ.counts = y, intervals = int, partial = FALSE)
SEGermRate(germ.counts = y, intervals = int, partial = FALSE)
GermRateRecip(germ.counts = y, intervals = int,
              method = "coolbear", partial = FALSE)
GermRateRecip(germ.counts = y, intervals = int,
              method = "farooq", partial = FALSE)




