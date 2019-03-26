library(mdir.logrank)


### Name: mdir.logrank
### Title: Two-sample multiple-direction log rank test
### Aliases: mdir.logrank

### ** Examples

library(coin)
data(GTSG)
out <- mdir.logrank(data = GTSG, nperm = 1000)

## Detailed information:
summary(out)




