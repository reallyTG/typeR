library(spider)


### Name: plot.slidWin
### Title: Plot a 'slidWin' object
### Aliases: plot.slidWin
### Keywords: Sliding window

### ** Examples


data(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

doloSlide <- slideAnalyses(dolomedes,  doloSpp, 200, interval=10, treeMeasures=TRUE)

graphics::plot(doloSlide)

doloBox <- slideBoxplots(dolomedes,  doloSpp, 200, interval=10, method="overall")

graphics::plot(doloBox)


data(anoteropsis)
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
    function(x) paste(x[1], x[2], sep="_"))

anoBox <- slideBoxplots(anoteropsis,  anoSpp, 200, interval=10, method="interAll")

graphics::plot(anoBox)
graphics::plot(anoBox, outliers=TRUE)





