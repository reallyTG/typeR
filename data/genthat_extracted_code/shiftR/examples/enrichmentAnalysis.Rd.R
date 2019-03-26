library(shiftR)


### Name: enrichmentAnalysis
### Title: Fast Enrichment Testing via Circular Permutations on Non-Binary
###   Outcomes
### Aliases: enrichmentAnalysis

### ** Examples

### Data size
n = 1e5

### Generate vectors of test statistics with local correlation
window = 1000
pvstats1 = diff(cumsum(runif(n+window)), lag = window)
pvstats2 = diff(cumsum(runif(n+window)), lag = window)

# Add a bit of dependence
pvstats1 = pvstats1 + 0.5 * pvstats2

# test top 0.1, 1, 3, 5, and 10 percent

percentiles1 = c(0.001, 0.01, 0.03, 0.05, 0.1)
percentiles2 = c(0.001, 0.01, 0.03, 0.05, 0.1)

# The offset margin

margin = 0.05

# Set the number of permutations
# to the maximum

npermute = 1e3


enr = enrichmentAnalysis(
        pvstats1,
        pvstats2,
        percentiles1,
        percentiles2,
        npermute,
        margin ,
        threads = 2)

# View the results
enr



