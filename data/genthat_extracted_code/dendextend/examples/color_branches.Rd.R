library(dendextend)


### Name: color_branches
### Title: Color tree's branches according to sub-clusters
### Aliases: color_branches colour_branches branches_color

### ** Examples


## Not run: 
##D par(mfrow = c(1,2))
##D dend <- USArrests %>% dist %>% hclust(method = "ave") %>% as.dendrogram
##D d1=color_branches(dend, k = 5, col = c(3,1,1,4,1))
##D plot(d1) # selective coloring of branches :)
##D d2=color_branches(d1,5)
##D plot(d2) 
##D 
##D par(mfrow = c(1,2))
##D d1=color_branches(dend,5, col = c(3,1,1,4,1),groupLabels=TRUE)
##D plot(d1) # selective coloring of branches :)
##D d2=color_branches(d1,5,groupLabels=TRUE)
##D plot(d2) 
##D 
##D par(mfrow = c(1,3))
##D d5=color_branches(dend,5)
##D plot(d5)
##D d5g=color_branches(dend,5,groupLabels=TRUE)
##D plot(d5g)
##D d5gr=color_branches(dend,5,groupLabels=as.roman)
##D plot(d5gr)
##D 
##D par(mfrow = c(1,1))
##D 
##D # messy - but interesting:
##D dend_override=color_branches(dend,2,groupLabels=as.roman)
##D dend_override=color_branches(dend_override,4,groupLabels=as.roman)
##D dend_override=color_branches(dend_override,7,groupLabels=as.roman)
##D plot(dend_override)
##D  
##D d5=color_branches(dend=dend[[1]],k=5)
##D  
##D 
##D library(dendextend) 
##D data(iris, envir = environment()) 
##D d_iris <- dist(iris[,-5])
##D hc_iris <- hclust(d_iris)
##D dend_iris <- as.dendrogram(hc_iris)
##D dend_iris=color_branches(dend_iris,k=3)
##D 
##D library(colorspace)
##D labels_colors(dend_iris) <-
##D  rainbow_hcl(3)[sort_levels_values(
##D  as.numeric(iris[,5])[order.dendrogram(dend_iris)]
##D  )]
##D 
##D plot(dend_iris, 
##D main = "Clustered Iris dataset",
##D  sub = "labels are colored based on the true cluster")
##D  
##D 
##D 
##D # cutree(dend_iris,k=3, order_clusters_as_data=FALSE,
##D    #  try_cutree_hclust=FALSE)
##D # cutree(dend_iris,k=3, order_clusters_as_data=FALSE)
##D 
##D library(colorspace)
##D 
##D data(iris, envir = environment()) 
##D d_iris <- dist(iris[,-5])
##D hc_iris <- hclust(d_iris)
##D labels(hc_iris) # no labels, because "iris" has no row names
##D dend_iris <- as.dendrogram(hc_iris)
##D is.integer(labels(dend_iris)) # this could cause problems...
##D 
##D iris_species <- rev(levels(iris[,5]))
##D dend_iris <- color_branches(dend_iris,k=3, groupLabels=iris_species)
##D is.character(labels(dend_iris)) # labels are no longer "integer"
##D 
##D # have the labels match the real classification of the flowers:
##D labels_colors(dend_iris) <-
##D    rainbow_hcl(3)[sort_levels_values(
##D       as.numeric(iris[,5])[order.dendrogram(dend_iris)]
##D    )]
##D 
##D # We'll add the flower type
##D labels(dend_iris) <- paste(as.character(iris[,5])[order.dendrogram(dend_iris)],
##D                            "(",labels(dend_iris),")", 
##D                            sep = "")
##D 
##D dend_iris <- hang.dendrogram(dend_iris,hang_height=0.1)
##D 
##D # reduce the size of the labels:
##D dend_iris <- assign_values_to_leaves_nodePar(dend_iris, 0.5, "lab.cex")
##D 
##D par(mar = c(3,3,3,7))
##D plot(dend_iris, 
##D      main = "Clustered Iris dataset
##D      (the labels give the true flower species)", 
##D      horiz =  TRUE,  nodePar = list(cex = .007))
##D legend("topleft", legend = iris_species, fill = rainbow_hcl(3))
##D a= dend_iris[[1]]
##D dend_iris1 <- color_branches(a,k = 3)
##D plot(dend_iris1)
##D 
##D # str(dendrapply(d2, unclass))
##D # unclass(d1)
##D 
##D c(1:5) %>% # take some data
##D    dist %>% # calculate a distance matrix, 
##D   # on it compute hierarchical clustering using the "average" method, 
##D    hclust(method = "single") %>% 
##D    as.dendrogram %>% color_branches(k=3) %>% plot # nice, returns the tree as is...
##D 
##D 
##D # Example of the "clusters" parameter
##D par(mfrow =c(1,2))
##D dend <- c(1:5) %>% dist %>% hclust %>% as.dendrogram 
##D dend %>% color_branches(k=3) %>% plot
##D dend %>% color_branches(clusters=c(1,1,2,2,3)) %>% plot
##D 
##D 
##D # another example, based on the question here:
##D # https://stackoverflow.com/q/45432271/256662
##D 
##D 
##D library(cluster)
##D set.seed(999)
##D iris2 <- iris[sample(x = 1:150,size = 50,replace = F),]
##D clust <- diana(iris2)
##D dend <- as.dendrogram(clust)
##D 
##D temp_col <- c("red", "blue", "green")[as.numeric(iris2$Species)]
##D temp_col <- temp_col[order.dendrogram(dend)]
##D temp_col <- factor(temp_col, unique(temp_col))
##D 
##D library(dendextend)
##D dend %>% color_branches(clusters = as.numeric(temp_col), col = levels(temp_col)) %>% 
##D    set("labels_colors", as.character(temp_col)) %>% 
##D    plot
##D 
##D 
##D 
## End(Not run)




