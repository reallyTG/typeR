library(SSRA)


### Name: scatterplot
### Title: Scatterplot Matrices
### Aliases: scatterplot

### ** Examples

# Example data based on Takeya (1991)

# Select items to be plotted
scatterplot(exdat, select = c("Item2", "Item3", "Item4"))

# Scatterplot matrix: jitter
scatterplot(exdat)

# Scatterplot matrix: size
scatterplot(exdat, type = "size")

# Scatterplot matrix: count
scatterplot(exdat, type = "count")

# Scatterplot matrix: sun
scatterplot(exdat, type = "sun")



