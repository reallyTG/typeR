library(ChemoSpec)


### Name: sgfSpectra
### Title: Apply Savitzky-Golay filters to a Spectra object
### Aliases: sgfSpectra
### Keywords: multivariate utilities

### ** Examples


  data(SrE.IR)
  myt1 <- expression(bolditalic(Serenoa)~bolditalic(repens)~bold(IR~Spectra))
  myt2 <- expression(bolditalic(Serenoa)~bolditalic(repens)~bold(IR~Spectra~(Smoothed)))

  par(mfrow = c(2, 1))
  plotSpectra(SrE.IR, xlim = c(1900, 2100), yrange = c(0, 0.05), main = myt1)
  temp <- sgfSpectra(SrE.IR)
  plotSpectra(temp, xlim = c(1900, 2100), yrange = c(0, 0.05), main = myt2)
  par(mfrow = c(1, 1))




