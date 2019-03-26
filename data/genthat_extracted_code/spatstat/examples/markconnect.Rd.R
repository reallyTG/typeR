library(spatstat)


### Name: markconnect
### Title: Mark Connection Function
### Aliases: markconnect
### Keywords: spatial nonparametric

### ** Examples

    # Hughes' amacrine data
    # Cells marked as 'on'/'off'
    data(amacrine)
    M <- markconnect(amacrine, "on", "off")
    plot(M)

    # Compute for all pairs of types at once
    plot(alltypes(amacrine, markconnect))



