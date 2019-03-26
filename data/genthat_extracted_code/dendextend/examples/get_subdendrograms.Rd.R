library(dendextend)


### Name: get_subdendrograms
### Title: Extract a list of _k_ subdendrograms from a given dendrogram
###   object
### Aliases: get_subdendrograms

### ** Examples


# needed packages:
# install.packages(gplots)
# install.packages(viridis)
# install.packages(devtools)
# devtools::install_github('talgalili/dendextend') #' dendextend from github

# define dendrogram object to play with:
dend <- iris[,-5] %>% dist %>% hclust %>% as.dendrogram %>%  
      set("labels_to_character") %>% color_branches(k=5)
dend_list <- get_subdendrograms(dend, 5)

# Plotting the result
par(mfrow = c(2,3))
plot(dend, main = "Original dendrogram")
sapply(dend_list, plot)

# plot a heatmap of only one of the sub dendrograms
par(mfrow = c(1,1))
library(gplots)
sub_dend <- dend_list[[1]] #' get the sub dendrogram
# make sure of the size of the dend
nleaves(sub_dend)
length(order.dendrogram(sub_dend))
# get the subset of the data
subset_iris <- as.matrix(iris[order.dendrogram(sub_dend),-5])
# update the dendrogram's internal order so to not cause an error in heatmap.2
order.dendrogram(sub_dend) <- rank(order.dendrogram(sub_dend))
heatmap.2(subset_iris, Rowv = sub_dend, trace = "none", col = viridis::viridis(100))





