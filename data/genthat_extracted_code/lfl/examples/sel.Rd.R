library(lfl)


### Name: sel
### Title: Select several rows and columns from a data object
### Aliases: sel sel.fsets sel.farules
### Keywords: models robust multivariate

### ** Examples

    x <- 0:100
    d <- fcut(x, 
              breaks=c(0, 25, 50, 75, 100),
              type='triangle')

    # select only first two columns
    res <- sel(d, , 1:2)
    print(res)

    # select only the 3rd row
    res <- sel(d, 3)
    print(res)



