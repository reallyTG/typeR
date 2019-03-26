library(matie)


### Name: fbvs
### Title: Forwards, backwards variable selection, picking variables to
###   maximize explained variance.
### Aliases: fbvs
### Keywords: association

### ** Examples

    # measure association for all pairs in a subrange of the baseball dataset
    data(baseballData)
    fbvs(baseballData,one="Salary")
    fbvs(baseballData,one="Salary",linear=TRUE)

    fbvs(baseballData,one="Salary",maxv=2)
    fbvs(baseballData,one="Salary",maxv=2,linear=TRUE)



