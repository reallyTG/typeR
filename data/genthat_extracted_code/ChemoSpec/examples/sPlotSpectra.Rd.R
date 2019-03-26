library(ChemoSpec)


### Name: sPlotSpectra
### Title: s-Plot of Spectra Data (Post PCA)
### Aliases: sPlotSpectra
### Keywords: hplot

### ** Examples


data(SrE.IR)
IR.pca <- c_pcaSpectra(SrE.IR)
myt <- expression(bolditalic(Serenoa)~bolditalic(repens)~bold(IR~Spectra))
splot <- sPlotSpectra(spectra = SrE.IR, pca = IR.pca, pc = 1, tol = 0.001,
  main = myt)




