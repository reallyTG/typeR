library(fitTetra)


### Name: fitTetra
### Title: Function to fit multiple mixture models to signal ratios of a
###   single bi-allelic marker.
### Aliases: fitTetra
### Keywords: utilities

### ** Examples

data(tetra.potato.SNP)
data(diplo.potato.SNP)
df.tetra <- with(tetra.potato.SNP, data.frame(MarkerName=MarkerName, 
                 SampleName=SampleName, ratio=X_Raw/(X_Raw+Y_Raw)))
df.diplo <- with(diplo.potato.SNP, data.frame(MarkerName=MarkerName, 
                 SampleName=SampleName, ratio=X_Raw/(X_Raw+Y_Raw)))
# Single marker, multiple mixture models
unmix <- fitTetra(marker=4, data=df.tetra)
#unmix <- fitTetra(marker=4, data=df.tetra, plot='fitted')
#unmix <- fitTetra(marker=4, data=df.tetra, diplo=df.diplo, plot='all')



