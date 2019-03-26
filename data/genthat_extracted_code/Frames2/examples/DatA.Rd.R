library(Frames2)


### Name: DatA
### Title: Database of household expenses for frame A
### Aliases: DatA
### Keywords: datasets

### ** Examples

data(DatA)
attach(DatA)
#Let perform a brief descriptive analysis for the three main variables
param <- data.frame(Feed, Clo, Lei)
summary (param)
hist (Feed)
hist (Clo)
hist (Lei)



