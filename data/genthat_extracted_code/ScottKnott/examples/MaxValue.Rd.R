library(ScottKnott)


### Name: MaxValue
### Title: Algorithm for Pre-order Path in Binary Decision Tree
### Aliases: MaxValue
### Keywords: package htest univar tree design

### ** Examples

##
## Examples: Completely Randomized Design (CRD)
##

data(CRD1)

av      <- with(CRD1,
                aov(y ~ x,
                    data=dfm))              # Doing an ANOVA
mm      <- model.tables(av,
                        "means")            # summary tables for model fits
tabs    <- mm$tables[-1]                    # all model means
which   <- names(av$model)[2]
tabs    <- tabs[which]                      # specified group means
nn      <- mm$n[names(tabs)]                # repetions number of specified groups
MSE     <- sum(resid(av)^2)/av$df.residual
tab     <- tabs[[which]]                    # tab=means
means   <- as.vector(tab)
mnumber <- length(means)                    # number of means
nms     <- names(tab)
r       <- nn[[which]]                      # groups and its number of replicates
ord     <- order(means,
                 decreasing=TRUE)
mMSE    <- MSE/r
dfr     <- av$df.residual                   # residual degrees of freedom
means   <- means[ord]                       # decreasing ordered means
g       <- mnumber

## Grouping the means: sig.level=.05
groups  <- MaxValue(g,
                    means,
                    mMSE,
                    dfr,
                    sig.level=.05,
                    1,
                    rep(0, g),
                    0,
                    rep(0, g))

## The result: sig.level=.05
groups


## Grouping the means: sig.level=.10
groups  <- MaxValue(g,
                    means,
                    mMSE,
                    dfr,
                    sig.level=.10,
                    1,
                    rep(0, g),
                    0,
                    rep(0, g))

## The result: sig.level=.10
groups



