library(spider)


### Name: slideNucDiag
### Title: Sliding nucleotide diagnostics
### Aliases: slideNucDiag
### Keywords: Sliding window

### ** Examples


data(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

slideNucDiag(dolomedes, doloSpp, 200, interval = 3)

slidND <- slideNucDiag(dolomedes, doloSpp, 200, interval = 3)

#Number of basepairs for each species
graphics::matplot(t(slidND), type = "l")

#Number of basepairs for a single species
graphics::plot(slidND[4, ], type = "l")

#Total number of basepairs per window
graphics::plot(colSums(slidND), type = "l")





