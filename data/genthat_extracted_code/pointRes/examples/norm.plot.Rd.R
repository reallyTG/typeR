library(pointRes)


### Name: norm.plot
### Title: Plot mean Cropper values and pointer years
### Aliases: norm.plot

### ** Examples

## Plot mean Cropper values and pointer years (method "Cropper")
data(s033)
py_c <- pointer.norm(s033, window = 5, method.thresh = "Cropper", 
                     series.thresh = 75)
norm.plot(py_c, start.yr = 1950, end.yr = NULL, 
          sd.disp = FALSE, x.tick.major = 10, x.tick.minor = 5)

## Plot mean Cropper values and pointer years (method "Neuwirth")
data(s033)
py_n <- pointer.norm(s033, window = 5, method.thresh = "Neuwirth",
                     series.thresh = 75)
norm.plot(py_n, start.yr = 1950, end.yr = NULL, 
          sd.disp = FALSE, x.tick.major = 10, x.tick.minor = 5)
          



