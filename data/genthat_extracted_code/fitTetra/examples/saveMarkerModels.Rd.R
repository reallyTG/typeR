library(fitTetra)


### Name: saveMarkerModels
### Title: A function to fit mixture models for series of markers and save
###   the results to files
### Aliases: saveMarkerModels
### Keywords: utilities

### ** Examples

data(tetra.potato.SNP)
data(diplo.potato.SNP)

df.tetra <- with(tetra.potato.SNP, data.frame(MarkerName=MarkerName, 
                 SampleName=SampleName, ratio=X_Raw/(X_Raw+Y_Raw)))
df.diplo <- with(diplo.potato.SNP, data.frame(MarkerName=MarkerName, 
                 SampleName=SampleName, ratio=X_Raw/(X_Raw+Y_Raw)))

# Multiple markers (only 1 is chosen here), multiple mixture models
saveMarkerModels(markers=87:87, data=df.tetra, diplo=df.diplo, plot='fitted', 
         try.HW=FALSE, modelfile = 'modelfile.dat', scorefile='scorefile.dat')



