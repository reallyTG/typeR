library(dendextend)


### Name: pvrect2
### Title: Draw Rectangles Around a Dendrogram's Clusters with High/Low
###   P-values
### Aliases: pvrect2

### ** Examples

## Not run: 
##D 
##D 
##D library(dendextend)
##D library(pvclust)
##D data(lung) # 916 genes for 73 subjects
##D set.seed(13134)
##D result <- pvclust(lung[, 1:20], method.dist="cor", method.hclust="average", nboot=10)
##D 
##D par(mar = c(9,2.5,2,0))
##D dend <- as.dendrogram(result)
##D dend %>%    
##D    pvclust_show_signif(result, signif_value = c(3,.5)) %>%
##D    pvclust_show_signif(result, signif_value = c("black", "grey"), show_type = "col") %>% 
##D    plot(main = "Cluster dendrogram with AU/BP values (%)")
##D pvrect2(result, alpha=0.95)
##D # getting the rects to the tips / above the labels
##D pvrect2(result, lower_rect = .15, border = 4, alpha=0.95, lty = 2)
##D # Original function
##D # pvrect(result, alpha=0.95)
##D text(result, alpha=0.95)
##D 
## End(Not run)




