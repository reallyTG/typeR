library(PTXQC)


### Name: plot_MBRgain
### Title: Plot MaxQuant Match-between-runs id transfer performance.
### Aliases: plot_MBRgain

### ** Examples

 data = data.frame(fc.raw.file = paste("file", letters[1:4]),
                   abs = c(5461, 5312, 3618, 502), 
                   pc = c(34, 32, 22, 2))
 plot_MBRgain(data, "MBR gain: 18%")




