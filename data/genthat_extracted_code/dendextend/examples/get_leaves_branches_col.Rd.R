library(dendextend)


### Name: get_leaves_branches_col
### Title: Get the colors of the branches of a dendrogram's leaves
### Aliases: get_leaves_branches_col

### ** Examples

# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

par(mfrow = c(1,2), mar = c(5,2,1,0))
dend <- dend %>% 
         color_branches(k = 3) %>%
         set("branches_lwd", c(2,1,2)) %>%
         set("branches_lty", c(1,2,1)) 
         
plot(dend)

labels_colors(dend)  <- get_leaves_branches_col(dend)
plot(dend)





