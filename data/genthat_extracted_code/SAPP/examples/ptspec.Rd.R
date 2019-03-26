library(SAPP)


### Name: ptspec
### Title: The Periodogram of Point Process Data
### Aliases: ptspec
### Keywords: spatial

### ** Examples

data(Brastings)  # The Occurrence Times Data of 627 Blastings
ptspec(Brastings, 1000, 0.5, 1.0,, c(2.0, 1.0, 0.5), 4600)

data(PoissonData)  # to see the contrasting difference
ptspec(PoissonData, 1000, 0.5, 1.0,, c(2.0, 1.0, 0.5), 5000)



