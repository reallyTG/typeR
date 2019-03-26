library(rLakeAnalyzer)


### Name: meta.depths
### Title: Calculate the Top and Bottom Depths of the Metalimnion
### Aliases: meta.depths
### Keywords: manip

### ** Examples


wtr = c(22.51, 22.42, 22.4, 22.4, 22.4, 22.36, 22.3, 22.21, 22.11, 21.23, 16.42, 
15.15, 14.24, 13.35, 10.94, 10.43, 10.36, 9.94, 9.45, 9.1, 8.91, 8.58, 8.43)

depths = c(0, 0.5, 1, 1.5, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 
			 17, 18, 19, 20)
			 
m.d = meta.depths(wtr, depths, slope=0.1, seasonal=FALSE)
cat('The top depth of the metalimnion is:', m.d[1])
cat('The bottom depth of the metalimnion is:', m.d[2])




