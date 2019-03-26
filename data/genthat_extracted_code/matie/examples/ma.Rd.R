library(matie)


### Name: ma
### Title: Measure association
### Aliases: ma
### Keywords: likelihood correlation nonlinear distribution

### ** Examples

    # bivariate association
    d <- shpd(n=1000,m=2,Rsq=0.9)
    ma(d)$A
    #
    # multivariate association (the proportion of variance in "Salary"
    # explained by "Hits" and "Years")
    data(baseballData)
    ma(baseballData,partition=list(11,c(2,7)))$A



