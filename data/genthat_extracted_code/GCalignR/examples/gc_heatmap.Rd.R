library(GCalignR)


### Name: gc_heatmap
### Title: Visualises peak alignments in form of a heatmap
### Aliases: gc_heatmap

### ** Examples


 ## aligned gc-dataset
 data("aligned_peak_data")
 ## Default settings: The final output is plotted
 gc_heatmap(aligned_peak_data, algorithm_step = "aligned")

 ## Plot the input data
 gc_heatmap(aligned_peak_data,algorithm_step = "input")

 ## Plot a subset of the first 50 scored substances
 gc_heatmap(aligned_peak_data,algorithm_step="aligned",substance_subset = 1:50)

 ## Plot specific samples, apply a stricter threshold
 gc_heatmap(aligned_peak_data,samples_subset = c("M2","P7","M13","P13"),threshold = 0.02)




