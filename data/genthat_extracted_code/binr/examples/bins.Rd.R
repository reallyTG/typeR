library(binr)


### Name: bins
### Title: Cut Numeric Values Into Evenly Distributed Groups (Bins)
### Aliases: bins bins.getvals bins.merr

### ** Examples

## Not run: 
##D    # Seriously skewed x:
##D    x <- floor(exp(rnorm(200000 * 1.3)))
##D    cuts <- bins(x, target.bins = 10, minpts = 2000)
##D    cuts$breaks <- bins.getvals(cuts)
##D    cuts$binct
##D    #   [0, 0]    [1, 1]    [2, 2]    [3, 3]    [4, 4]    [5, 5]    [6, 7]   [8, 10]
##D    # 129868     66611     28039     13757      7595      4550      4623      2791
##D    #   [11, 199]
##D    # 2166
##D 
##D    # Centered x:
##D    x <- rep(c(1:10,20,31:40), c(rep(1, 10), 100, rep(1,10)))
##D    cuts <- bins(x, target.bins = 3, minpts = 10)
##D    cuts$binct
##D    # [1, 10] [20, 20] [31, 40]
##D    #      10      100       10
## End(Not run)



