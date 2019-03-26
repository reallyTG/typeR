library(PTXQC)


### Name: plot_MBRAlign
### Title: Plot MaxQuant Match-between-runs alignment performance.
### Aliases: plot_MBRAlign

### ** Examples


 data = data.frame(fc.raw.file_ext = "file A", ## more than one would be possible
                   calibrated.retention.time = c(20:100), 
                   retention.time.calibration = 6 + sin((20:100)/10))
 data$rtdiff = rnorm(nrow(data))
 data$RTdiff_in = c("green", "red")[1 + (abs(data$rtdiff) > 0.7)]
 
 plot_MBRAlign(data, c(-10, 10), "fancy subtitle", 0.7)




