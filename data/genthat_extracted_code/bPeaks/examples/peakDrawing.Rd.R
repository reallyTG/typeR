library(bPeaks)


### Name: peakDrawing
### Title: Function to draw graphical representations of genomic regions
###   detected using bPeaks methodology
### Aliases: peakDrawing
### Keywords: bPeaks

### ** Examples

# get library 
library(bPeaks)

# get PDR1 data
data(dataPDR1)

# IP signal (smoothed) - Chromosome IV
IPsignal = dataSmoothing(dataPDR1$IPdata[dataPDR1$IPdata[,1] == "chrIV",3], 20)
# control signal (smoothed)
controlSignal = dataSmoothing(dataPDR1$controlData[dataPDR1$controlData[,1] == "chrIV",3], 20)

# draw all chromosome
peakDrawing(vecIP = IPsignal, vecControl = controlSignal, 
            lineIP = 0, lineControl = 0, lineFC = 0, lineAverage = 0, 
            posInf = 465000, posSup = 465550, 
            add = 10, title = "PDR1 data - chromosome #4")




