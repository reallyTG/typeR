library(UniIsoRegression)


### Name: reg_2d
### Title: Isotonic Regression on 2D input.
### Aliases: reg_2d

### ** Examples

    library(UniIsoRegression)
    #===2d monotonic===
    y=matrix(c(2, 4, 3, 1, 5, 7,9,0), nrow=2, ncol=4, byrow = TRUE)
    weight=matrix(c(1, 10, 3, 9, 5, 7,9,10), nrow=2, ncol=4, byrow = TRUE)

    #l_1 metric
    temp=UniIsoRegression::reg_2d(y, weight, metric = 1)
    print(temp)

    #l_2 metric
    temp=UniIsoRegression::reg_2d(y, weight, metric = 2)
    print(temp)



