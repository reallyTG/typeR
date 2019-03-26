library(wql)


### Name: decompTs
### Title: Decompose a time series
### Aliases: decompTs
### Keywords: manip ts

### ** Examples


# Apply the function to a single series (Station 27) and plot it:
y <- decompTs(sfbayChla[, 's27'])
y
plot(y, nc=1, main="")




