library(matie)


### Name: ma.test
### Title: p-value for an association score.
### Aliases: ma.test
### Keywords: p value

### ** Examples

    d <- shpd(n=100,m=2,Rsq=0.2)
    aScore <- ma(d)
    ma.test(d, aScore)
    # or set lookup to FALSE if you have computing time available
    # ma.test(d, aScore, lookup=FALSE, reps=10000)



