library(fitTetra)


### Name: fitTetra-package
### Title: Fits mixture models for genotype calling in tetraploid species
### Aliases: fitTetra-package
### Keywords: package

### ** Examples

data(tetra.potato.SNP)
data(diplo.potato.SNP)
SNP4 <- subset(tetra.potato.SNP, MarkerName=='PotSNP004')
# Single marker, single mixture model
rawratio <- SNP4$X_Raw/(SNP4$X_Raw+SNP4$Y_Raw) 
unmix <- CodomMarker(rawratio)

# Single marker, multiple mixture models
# df.tetra <- with(tetra.potato.SNP, data.frame(MarkerName=MarkerName, 
#                   SampleName=SampleName, ratio=X_Raw/(X_Raw+Y_Raw)))
# df.diplo <- with(diplo.potato.SNP, data.frame(MarkerName=MarkerName, 
#                  SampleName=SampleName, ratio=X_Raw/(X_Raw+Y_Raw)))

# unmix <- fitTetra(marker=6, data=df.tetra)
# unmix <- fitTetra(marker=6, data=df.tetra, plot='fitted')
# unmix <- fitTetra(marker=6, data=df.tetra, diplo=df.diplo, plot='all')

# Multiple markers (3 are chosen), multiple mixture models
# saveMarkerModels(markers=4:6, data=df.tetra, diplo=df.diplo, plot='all',
#                  maxiter=40, logfile='output.log', modelfile='mixresults.dat',
#                  allmodelsfile='allmixresults.dat', scorefile='scores.dat')



