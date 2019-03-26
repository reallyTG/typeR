library(dendextend)


### Name: get_leaves_branches_attr
### Title: Get an attribute of the branches of a dendrogram's leaves
### Aliases: get_leaves_branches_attr

### ** Examples

# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

dend <- dend %>% 
         color_branches(k = 3) %>%
         set("branches_lwd", c(2,1,2)) %>%
         set("branches_lty", c(1,2,1))
         
plot(dend)

get_leaves_branches_attr(dend, "col")
get_leaves_branches_attr(dend, "lwd")
get_leaves_branches_attr(dend, "lty")

labels_colors(dend)  <- get_leaves_branches_attr(dend, "col")
plot(dend)





