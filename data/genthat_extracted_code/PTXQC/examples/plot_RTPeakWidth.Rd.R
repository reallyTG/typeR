library(PTXQC)


### Name: plot_RTPeakWidth
### Title: Plot RT peak width over time
### Aliases: plot_RTPeakWidth

### ** Examples


 data = data.frame(fc.raw.file = rep(c("file A", "file B", "file C"), each=81),
                   RT = c(20:100), 
                   peakWidth = c(rnorm(81, mean=20), rnorm(81, mean=10), rnorm(81, mean=30)))
 plot_RTPeakWidth(data, c(10, 100), c(0, 40))




