library(miscor)


### Name: scatterplot
### Title: Scatterplot Matrices
### Aliases: scatterplot

### ** Examples

dat <- round(sim.cor(200, rho = 0.7))

# Scatterplot matrix: jitter
scatterplot(dat)

# Scatterplot matrix: size
scatterplot(dat, type = "size")

# Scatterplot matrix: count
scatterplot(dat, type = "count")

# Scatterplot matrix: sun
scatterplot(dat, type = "sun")



