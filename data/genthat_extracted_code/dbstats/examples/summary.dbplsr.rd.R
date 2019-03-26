library(dbstats)


### Name: summary.dbplsr
### Title: Summarizing distance-based partial least squares fits
### Aliases: summary.dbplsr print.summary.dbplsr

### ** Examples

# require(pls)
library(pls)
data(yarn)
## Default methods:
yarn.dbplsr <- dbplsr(density ~ NIR, data = yarn, ncomp=6, method="GCV")
summary(yarn.dbplsr)



