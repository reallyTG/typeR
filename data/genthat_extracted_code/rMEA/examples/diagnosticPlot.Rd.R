library(rMEA)


### Name: diagnosticPlot
### Title: Plots the initial, middle and ending part of a MEA object
### Aliases: diagnosticPlot

### ** Examples

## read a single file
path_normal <- system.file("extdata/normal/200_01.txt", package = "rMEA")
mea_normal <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist", skip=1,
                     idOrder = c("id","session"), idSep="_")
## Visual inspection of the data
diagnosticPlot(mea_normal[[1]])




