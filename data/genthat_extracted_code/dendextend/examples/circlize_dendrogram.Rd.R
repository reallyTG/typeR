library(dendextend)


### Name: circlize_dendrogram
### Title: Plot a circlized dendrograms
### Aliases: circlize_dendrogram

### ** Examples


## Not run: 
##D 
##D dend <- iris[1:40,-5] %>% dist %>% hclust %>% as.dendrogram %>%
##D    set("branches_k_color", k=3) %>% set("branches_lwd", c(5,2,1.5)) %>%
##D    set("branches_lty", c(1,1,3,1,1,2)) %>%
##D    set("labels_colors") %>% set("labels_cex", c(.9,1.2)) %>%
##D    set("nodes_pch", 19) %>% set("nodes_col", c("orange", "black", "plum", NA))
##D    
##D circlize_dendrogram(dend)
##D circlize_dendrogram(dend, labels = FALSE)
##D circlize_dendrogram(dend, facing = "inside", labels = FALSE)
##D 
##D 
##D # In the following we get the dendrogram but can also get extra information on top of it
##D circos.initialize("foo", xlim = c(0, 40))
##D circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
##D    circos.rect(1:40-0.8, rep(0, 40), 1:40-0.2, runif(40), col = rand_color(40), border = NA)
##D }, bg.border = NA)
##D circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
##D    circos.text(1:40-0.5, rep(0, 40), labels(dend), col = labels_colors(dend),
##D                facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
##D }, bg.border = NA, track.height = 0.1)
##D max_height = attr(dend, "height")
##D circos.track(ylim = c(0, max_height), panel.fun = function(x, y) {
##D    circos.dendrogram(dend, max_height = max_height)
##D }, track.height = 0.5, bg.border = NA)
##D circos.clear()
##D 
##D 
##D 
## End(Not run)



