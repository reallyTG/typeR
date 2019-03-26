library(dad)


### Name: plot.foldert
### Title: Plotting data of a foldert
### Aliases: plot.foldert

### ** Examples

data(floribundity)
ftflor <- foldert(floribundity, cols.select = "union", rows.select = "union")
plot(ftflor, which = "nflowers", ylab = "Number of flowers per plant",
     main = "Floribundity of rosebushes, 2010, Angers (France)")



