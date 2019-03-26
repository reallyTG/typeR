library(Frames2)


### Name: DatB
### Title: Database of household expenses for frame B
### Aliases: DatB
### Keywords: datasets

### ** Examples

data(DatB)
attach(DatB)
#Let perform a brief descriptive analysis for the three main variables
param <- data.frame(Feed, Clo, Lei)
summary (param)
hist (Feed)
hist (Clo)
hist (Lei)



