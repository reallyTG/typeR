library(LCox)


### Name: LCox
### Title: Hypothesis Testing for longitudinal gene profiles and the
###   survival outcome.
### Aliases: LCox

### ** Examples

data.list = simudata()
data = data.list$data
data.id = data.list$data.id
res = LCox(data = data, data.id = data.id, geneID = 3:4)
res = LCox(data = data, data.id = data.id, geneID = 3:4, varID = 4)
res = LCox(data = data, data.id = data.id, geneID = 3:4, PLOT=TRUE)



