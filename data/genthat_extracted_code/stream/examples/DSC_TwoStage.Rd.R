library(stream)


### Name: DSC_TwoStage
### Title: TwoStage Clustering Process
### Aliases: DSC_TwoStage

### ** Examples

stream <- DSD_Gaussians(k=3)

# Create a clustering process that uses a window for the online stage and
# k-means for the offline stage (reclustering)
win_km <- DSC_TwoStage(
  micro=DSC_Window(horizon=100), 
  macro=DSC_Kmeans(k=3)
  ) 
win_km
  
update(win_km, stream, 200) 
win_km
plot(win_km, stream, type="both")  
evaluate(win_km, stream, assign="macro")



