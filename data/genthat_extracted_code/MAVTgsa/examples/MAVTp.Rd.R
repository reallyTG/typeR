library(MAVTgsa)


### Name: MAVTp
### Title: Random Forests-based procedure
### Aliases: MAVTp
### Keywords: Random forests

### ** Examples


data(data)
data(GS)
a=proc.time()
MAVTp(data,GS, nbPerm = 50, numoftree = 500, type = "cate", impt = TRUE)
proc.time()-a




