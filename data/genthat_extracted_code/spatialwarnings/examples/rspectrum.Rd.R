library(spatialwarnings)


### Name: rspectrum
### Title: r-spectrum
### Aliases: rspectrum

### ** Examples


# Spectrum of white noise
rmat <- matrix(runif(100*100) > .5, ncol = 100)
spec <- rspectrum(rmat) 
plot(spec, type = "l")

# Add some spatial correlation and compare the two spectra
rmat.cor <- rmat
for (i in seq(1, nrow(rmat)-1)) { 
  for (j in seq(1, nrow(rmat)-1)) { 
    rmat.cor[i,j] <- mean(rmat[(i-1):(i+1), (j-1):(j+1)])
  }
}
spec.cor <- rspectrum(rmat.cor)
plot(spec.cor, type = "n")
lines(spec, col = "black")
lines(spec.cor, col = "blue")




