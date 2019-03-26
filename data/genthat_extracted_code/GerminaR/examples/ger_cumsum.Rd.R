library(GerminaR)


### Name: ger_cumsum
### Title: Cumulative sum of germination matrix
### Aliases: ger_cumsum

### ** Examples


library(GerminaR)
dt <- prosopis
gcs <- ger_cumsum(SeedN = "seeds", evalName = "D", method = "percentage", data = dt)
head(gcs, 10)



