library(spider)


### Name: threshOpt
### Title: Threshold optimisation
### Aliases: threshOpt
### Keywords: Barcoding

### ** Examples


data(anoteropsis)
anoDist <- ape::dist.dna(anoteropsis)
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
    function(x) paste(x[1], x[2], sep="_"))
threshOpt(anoDist, anoSpp)

data(dolomedes)
doloDist <- ape::dist.dna(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)
threshOpt(doloDist, doloSpp)

#Conduct the analysis over a range of values to determine the optimum threshold
threshVal <- seq(0.001,0.02, by = 0.001)
opt <- lapply(threshVal, function(x) threshOpt(doloDist, doloSpp, thresh = x))
optMat <- do.call(rbind, opt)
graphics::barplot(t(optMat)[4:5,], names.arg=optMat[,1], xlab="Threshold values", 
    ylab="Cumulative error")
graphics::legend(x = 2.5, y = 29, legend = c("False positives", "False negatives"), 
    fill = c("grey75", "grey25"))




