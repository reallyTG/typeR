library(stream)


### Name: update
### Title: Update a Data Stream Clustering Model
### Aliases: update update.DSC_R update.DSC_TwoStage update.DSO_Sample
###   update.DSO_Window

### ** Examples

stream <- DSD_Gaussians(k=3)
dstream <- DSC_DStream(gridsize=.05)  

update(dstream, stream, 500)
plot(dstream, stream)



