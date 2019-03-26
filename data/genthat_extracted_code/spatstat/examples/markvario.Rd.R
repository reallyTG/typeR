library(spatstat)


### Name: markvario
### Title: Mark Variogram
### Aliases: markvario
### Keywords: spatial nonparametric

### ** Examples

    # Longleaf Pine data
    # marks represent tree diameter
    data(longleaf)
    # Subset of this large pattern
    swcorner <- owin(c(0,100),c(0,100))
    sub <- longleaf[ , swcorner]
    # mark correlation function
    mv <- markvario(sub)
    plot(mv)



