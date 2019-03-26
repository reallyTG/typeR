library(StatRank)


### Name: Generate.NPRUM.Data
### Title: Generate data from an NPRUM model
### Aliases: Generate.NPRUM.Data

### ** Examples

Data.Tiny <- matrix(c(1, 2, 3, 3, 2, 1, 1, 2, 3), ncol = 3, byrow = TRUE)
Estimate <- Estimation.RUM.Nonparametric(Data.Tiny, m = 3, iter = 3)
Generate.NPRUM.Data(Estimate, 3, bw = 0.1)



