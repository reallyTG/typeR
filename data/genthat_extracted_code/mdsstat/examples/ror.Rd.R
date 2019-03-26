library(mdsstat)


### Name: ror
### Title: Reporting Odds Ratio
### Aliases: ror ror.mds_ts ror.default

### ** Examples

# Basic Example
data <- data.frame(time=c(1:25),
                   nA=as.integer(stats::rnorm(25, 25, 5)),
                   nB=as.integer(stats::rnorm(25, 50, 5)),
                   nC=as.integer(stats::rnorm(25, 100, 25)),
                   nD=as.integer(stats::rnorm(25, 200, 25)))
a1 <- ror(data)
# Example using an mds_ts object
a2 <- ror(mds_ts[[3]])




