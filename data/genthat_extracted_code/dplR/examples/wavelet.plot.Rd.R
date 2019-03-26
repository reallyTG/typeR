library(dplR)


### Name: wavelet.plot
### Title: Plot a Continuous Wavelet Transform
### Aliases: wavelet.plot
### Keywords: hplot

### ** Examples
library(stats)
library(utils)
data(ca533)
ca533.rwi <- detrend(rwl = ca533, method = "ModNegExp")
ca533.crn <- chron(ca533.rwi, prefix = "CAM", prewhiten = FALSE)
Years <- time(ca533.crn)
CAMstd <- ca533.crn[, 1]
out.wave <- morlet(y1 = CAMstd, x1 = Years, p2 = 9, dj = 0.1,
                   siglvl = 0.99)
wavelet.plot(out.wave, useRaster = NA)
# Alternative palette with better separation of colors
# via: rev(RColorBrewer::brewer.pal(10, "Spectral"))
specCols <- c("#5E4FA2", "#3288BD", "#66C2A5", "#ABDDA4", "#E6F598", 
              "#FEE08B", "#FDAE61", "#F46D43", "#D53E4F", "#9E0142")
wavelet.plot(out.wave, key.cols=specCols,useRaster = NA)

# fewer colors
levs <- quantile(out.wave$Power, probs = c(0, 0.5, 0.75, 0.9, 0.99))
wavelet.plot(out.wave, wavelet.levels = levs, add.sig = FALSE,
             key.cols = c("#FFFFFF", "#ABDDA4", "#FDAE61", "#D7191C"), useRaster = NA)



