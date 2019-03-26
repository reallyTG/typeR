library(spider)


### Name: rankSlidWin
### Title: Rank a 'slidWin' object.
### Aliases: rankSlidWin
### Keywords: Sliding window

### ** Examples


data(dolomedes)
doloDist <- ape::dist.dna(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

doloSlide <- slideAnalyses(dolomedes, doloSpp, 200, interval = 10, treeMeasures = TRUE)

rankSlidWin(doloSlide)
rankSlidWin(doloSlide, criteria = "zero_distances")

doloSlide2 <- slideAnalyses(dolomedes, doloSpp, 200, interval = 10, treeMeasures = FALSE)
rankSlidWin(doloSlide2)

doloSlide3 <- slideAnalyses(dolomedes, doloSpp, 200, interval = 10, distMeasures = FALSE, 
    treeMeasures = TRUE)
rankSlidWin(doloSlide3)




