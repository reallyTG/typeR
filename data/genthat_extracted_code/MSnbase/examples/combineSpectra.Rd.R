library(MSnbase)


### Name: combineSpectra,Spectra-method
### Title: Combine Spectra
### Aliases: combineSpectra,Spectra-method combineSpectra

### ** Examples


set.seed(123)
mzs <- seq(1, 20, 0.1)
ints1 <- abs(rnorm(length(mzs), 10))
ints1[11:20] <- c(15, 30, 90, 200, 500, 300, 100, 70, 40, 20) # add peak
ints2 <- abs(rnorm(length(mzs), 10))
ints2[11:20] <- c(15, 30, 60, 120, 300, 200, 90, 60, 30, 23)
ints3 <- abs(rnorm(length(mzs), 10))
ints3[11:20] <- c(13, 20, 50, 100, 200, 100, 80, 40, 30, 20)

## Create the spectra.
sp1 <- new("Spectrum1", mz = mzs + rnorm(length(mzs), sd = 0.01),
    intensity = ints1, rt = 1)
sp2 <- new("Spectrum1", mz = mzs + rnorm(length(mzs), sd = 0.01),
    intensity = ints2, rt = 2)
sp3 <- new("Spectrum1", mz = mzs + rnorm(length(mzs), sd = 0.009),
    intensity = ints3, rt = 3)

spctra <- Spectra(sp1, sp2, sp3,
    elementMetadata = DataFrame(idx = 1:3, group = c("b", "a", "a")))

## Combine the spectra reporting the maximym signal
res <- combineSpectra(spctra, mzd = 0.05, intensityFun = max)
res

## All values other than m/z and intensity are kept from the first spectrum
rtime(res)

## Plot the individual and the merged spectrum
par(mfrow = c(2, 1), mar = c(4.3, 4, 1, 1))
plot(mz(sp1), intensity(sp1), xlim = range(mzs[5:25]), type = "h", col = "red")
points(mz(sp2), intensity(sp2), type = "h", col = "green")
points(mz(sp3), intensity(sp3), type = "h", col = "blue")
plot(mz(res[[1]]), intensity(res[[1]]), type = "h",
    col = "black", xlim = range(mzs[5:25]))

## Combine spectra in two sets.
res <- combineSpectra(spctra, fcol = "group", mzd = 0.05)
res

rtime(res)

## Plot the individual and the merged spectra
par(mfrow = c(3, 1), mar = c(4.3, 4, 1, 1))
plot(mz(sp1), intensity(sp1), xlim = range(mzs[5:25]), type = "h", col = "red")
points(mz(sp2), intensity(sp2), type = "h", col = "green")
points(mz(sp3), intensity(sp3), type = "h", col = "blue")
plot(mz(res[[1]]), intensity(res[[1]]), xlim = range(mzs[5:25]), type = "h",
    col = "black")
plot(mz(res[[2]]), intensity(res[[2]]), xlim = range(mzs[5:25]), type = "h",
    col = "black")



