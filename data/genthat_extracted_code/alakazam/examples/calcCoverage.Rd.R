library(alakazam)


### Name: calcCoverage
### Title: Calculate sample coverage
### Aliases: calcCoverage

### ** Examples

# Calculate clone sizes
clones <- countClones(ExampleDb, groups="SAMPLE")

# Calculate 1first order coverage for a single sample
calcCoverage(clones$SEQ_COUNT[clones$SAMPLE == "+7d"])




