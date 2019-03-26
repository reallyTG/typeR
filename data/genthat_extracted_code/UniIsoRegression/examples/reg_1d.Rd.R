library(UniIsoRegression)


### Name: reg_1d
### Title: Isotonic and Unimodal Regression on 1D input.
### Aliases: reg_1d

### ** Examples

    library(UniIsoRegression)

    #===1d monotonic===
    y=c(1,3,6,7,-1)
    weight=c(1,3,4,9,10)

    #l_1 metric decreasing
    temp=UniIsoRegression::reg_1d(y, weight, metric = 1, decreasing = TRUE)
    print(temp)

    #l_2 metric unimodel
    temp=UniIsoRegression::reg_1d(y, weight, metric = 2, unimodal = TRUE)
    print(temp)

    #l_infinity metric increasing
    temp=UniIsoRegression::reg_1d(y, weight, metric = 3)
    print(temp)



