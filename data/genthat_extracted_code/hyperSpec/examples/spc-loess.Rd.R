library(hyperSpec)


### Name: spc.loess
### Title: loess smoothing interpolation for spectra Spectra can be
###   smoothed and interpolated on a new wavelength axis using 'loess'.
### Aliases: spc.loess
### Keywords: datagen manip

### ** Examples


plot (flu, col = "darkgray")
plot (spc.loess(flu, seq (420, 470, 5)), add = TRUE, col = "red")

flu [[3, ]] <- NA_real_
smooth <- spc.loess(flu, seq (420, 470, 5))
smooth [[, ]]
plot (smooth, add = TRUE, col = "blue")




