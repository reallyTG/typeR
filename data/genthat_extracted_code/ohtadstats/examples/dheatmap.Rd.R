library(ohtadstats)


### Name: dheatmap
### Title: Heatmap Plot
### Aliases: dheatmap

### ** Examples

data(miyashita_langley_data)
miyashita_langley_subset <- miyashita_langley_data[,1:15]
ml_results <- dwrapper(miyashita_langley_subset)
dheatmap(ml_results[["d2it_mat"]], mode = 'linear')

## Not run: 
##D data(miyashita_langley_data)
##D ml_results <- dwrapper(miyashita_langley_data)
##D dheatmap(ml_results[["d2it_mat"]], mode = 'linear')
## End(Not run)




