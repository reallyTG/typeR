library(dendextend)


### Name: branches_attr_by_clusters
### Title: Change col/lwd/lty of branches based on clusters
### Aliases: branches_attr_by_clusters

### ** Examples


## Not run: 
##D 
##D ### Getting the hc object
##D iris_dist <- iris[,-5] %>% dist
##D hc <-  iris_dist %>% hclust 
##D # This is how it looks without any colors:
##D dend <- as.dendrogram(hc)
##D plot(dend)
##D 
##D # Both functions give the same outcome
##D # options 1:
##D dend %>% set("branches_k_color", k = 4) %>% plot
##D # options 2:
##D clusters <- cutree(dend, 4)[order.dendrogram(dend)]
##D dend %>% branches_attr_by_clusters(clusters) %>% plot
##D 
##D # and the second option is much slower:
##D system.time(set(dend, "branches_k_color", k = 4)) # 0.26 sec
##D system.time(branches_attr_by_clusters(dend, clusters)) # 1.61 sec
##D # BUT, it also allows us to do more flaxible things!
##D 
##D #--------------------------
##D #   Plotting dynamicTreeCut
##D #--------------------------
##D 
##D # let's get the clusters
##D library(dynamicTreeCut)
##D clusters <- cutreeDynamic(hc, distM = as.matrix(iris_dist))
##D # we need to sort them to the order of the dendrogram:
##D clusters <- clusters[order.dendrogram(dend)]
##D 
##D # get some functions:
##D library(dendextendRcpp)
##D library(colorspace)
##D no0_unique <- function(x) {
##D    u_x <- unique(x)   
##D    u_x[u_x != 0]
##D }
##D 
##D clusters_numbers <- no0_unique(clusters)
##D n_clusters <- length(clusters_numbers)
##D cols <- rainbow_hcl(n_clusters)
##D dend2 <- branches_attr_by_clusters(dend, clusters, values = cols)
##D # dend2 <- branches_attr_by_clusters(dend, clusters)
##D plot(dend2)
##D # add colored bars:
##D ord_cols <- rainbow_hcl(n_clusters)[order(clusters_numbers)]
##D tmp_cols  <- rep(1, length(clusters))
##D tmp_cols[clusters != 0] <- ord_cols[clusters != 0][clusters]
##D colored_bars(tmp_cols, y_shift = -1.1, rowLabels = "")
##D # all of the ordering is to handle the fact that the cluster numbers are not ascending...
##D 
##D # How is this compared with the usual cutree?
##D dend3 <- color_branches(dend, k = n_clusters)
##D labels(dend2) <- as.character(labels(dend2)) 
##D # this needs fixing, since the labels are not character!
##D # Well, both cluster solutions are not perfect, but at least they are interesting...
##D  tanglegram(dend2, dend3, 
##D             main_left = "cutreeDynamic", main_right = "cutree",
##D             columns_width = c(5,.5,5), 
##D             color_lines = cols[iris[order.dendrogram(dend2),5]])
##D # (Notice how the color_lines is of the true Species of each Iris)
##D # The main difference is at the bottom,
##D 
## End(Not run)



