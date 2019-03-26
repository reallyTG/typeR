library(matie)


### Name: spa
### Title: Semi-partial association (computes association while controlling
###   for variables)
### Aliases: spa
### Keywords: semi-partial correlation association

### ** Examples

    # When the association between Y and X is entirely explained by C
    C <- rnorm(1000)
    X <- C+rnorm(1000)*0.5
    Y <- C+rnorm(1000)*0.5
    # See the relationship without controlling for C
    ma(cbind(X,Y))$A
    # See the relationship with C as a covariate (should be close to 0)
    spa(Y,X,C)
    # if you have ppcor then you can verify that 
    # the linear semi-partial correlation is similar, 
    # as these associations are all linear
    # spcor.test(Y,X,C)$estimate^2
    #
    # When the association between Y and X is only partially explained by C
    C <- rnorm(1000)
    X <- C+rnorm(1000)*0.5
    Y <- X+rnorm(1000)*0.5
    # See the relationship without controlling for C
    ma(cbind(X,Y))$A
    # See the relationship with C as a covariate 
    # (should be lower than the uncontrolled one, but not as low as 0)
    spa(Y,X,C)
    # if you have ppcor then you can verify that 
    # the linear semi-partial correlation is similar, 
    # as these associations are all linear
    # spcor.test(Y,X,C)$estimate^2
    #
    #   
    # if you have rgl you can plot the data
    # library(rgl)
    # plot3d(X,C,Y)



