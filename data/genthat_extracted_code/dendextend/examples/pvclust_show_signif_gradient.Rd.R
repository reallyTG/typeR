library(dendextend)


### Name: pvclust_show_signif_gradient
### Title: Significance gradient of branches in a dendrogram (via pvclust)
### Aliases: pvclust_show_signif_gradient

### ** Examples

## Not run: 
##D library(pvclust)
##D data(lung) # 916 genes for 73 subjects
##D set.seed(13134)
##D result <- pvclust(lung[, 1:20], method.dist="cor", method.hclust="average", nboot=100)
##D 
##D dend <- as.dendrogram(result)
##D result %>% as.dendrogram %>% 
##D    hang.dendrogram %>% 
##D    plot(main = "Cluster dendrogram with AU/BP values (%)")
##D result %>% text
##D result %>% pvrect(alpha=0.95)
##D 
##D dend %>% pvclust_show_signif(result) %>% plot
##D dend %>% pvclust_show_signif(result, show_type = "lwd") %>% plot
##D result %>% text
##D result %>% pvrect(alpha=0.95)
##D 
##D dend %>% pvclust_show_signif_gradient(result) %>% plot
##D 
##D dend %>% 
##D    pvclust_show_signif_gradient(result) %>% 
##D    pvclust_show_signif(result) %>%
##D    plot(main = "Cluster dendrogram with AU/BP values (%)\n bp values are highlighted by signif")
##D result %>% text
##D result %>% pvrect(alpha=0.95)
## End(Not run)



