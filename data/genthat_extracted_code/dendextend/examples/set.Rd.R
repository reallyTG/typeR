library(dendextend)


### Name: set
### Title: Set (/update) features to a dendrogram
### Aliases: set set.dendrogram set.dendlist set.data.table

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D 
##D # Getting the dend object
##D dend <- iris[ss,-5] %>% dist %>% hclust %>% as.dendrogram
##D dend %>% plot
##D 
##D dend %>% labels
##D dend %>% set("labels", 1:10) %>% labels
##D dend %>% set("labels", 1:10) %>% plot 
##D dend %>% set("labels_color") %>% plot 
##D dend %>% set("labels_col", c(1,2)) %>% plot # Works also with partial matching :)
##D dend %>% set("labels_cex", c(1, 1.2)) %>% plot 
##D dend %>% set("leaves_pch", NA) %>% plot 
##D dend %>% set("leaves_pch", c(1:5)) %>% plot    
##D dend %>% set("leaves_pch", c(19,19, NA)) %>% 
##D    set("leaves_cex", c(1,2)) %>% plot 
##D dend %>% set("leaves_pch", c(19,19, NA)) %>% 
##D    set("leaves_cex", c(1,2)) %>%
##D    set("leaves_col", c(1,1,2,2)) %>% 
##D    plot 
##D dend %>% set("hang") %>% plot 
##D 
##D dend %>% set("branches_k_col") %>% plot 
##D dend %>% set("branches_k_col", c(1,2)) %>% plot 
##D dend %>% set("branches_k_col", c(1,2,3), k=3) %>% plot
##D dend %>% set("branches_k_col", k=3) %>% plot 
##D 
##D dend %>% set("branches_k_lty", k=3) %>% plot 
##D dend %>% set("branches_k_col", k=3) %>% set("branches_k_lty", k=3) %>% plot 
##D 
##D dend %>% set("branches_col", c(1,2, 1, 2, NA)) %>% plot
##D dend %>% set("branches_lwd", c(2,1,2)) %>% plot
##D dend %>% set("branches_lty", c(1,2,1)) %>% plot
##D 
##D #    clears all of the things added to the leaves
##D dend %>% 
##D    set("labels_color", c(19,19, NA)) %>% 
##D    set("leaves_pch", c(19,19, NA))  %>%  # plot  
##D    set("clear_leaves") %>% # remove all of what was done until this point
##D    plot
##D # Different order
##D dend %>% 
##D    set("leaves_pch", c(19,19, NA)) %>% 
##D    set("labels_color", c(19,19, NA)) %>% 
##D    set("clear_leaves") %>% plot
##D 
##D 
##D # doing this without chaining (%>%) will NOT be fun:
##D dend %>% 
##D    set("labels", 1:10) %>%
##D    set("labels_color") %>%
##D    set("branches_col", c(1,2, 1, 2, NA)) %>%
##D    set("branches_lwd", c(2,1,2)) %>%
##D    set("branches_lty", c(1,2,1)) %>%
##D    set("hang") %>%
##D    plot 
##D 
##D par(mfrow = c(1,3))
##D dend %>% set("highlight_branches_col") %>% plot 
##D dend %>% set("highlight_branches_lwd") %>% plot 
##D dend %>% set("highlight_branches_col") %>% set("highlight_branches_lwd") %>% plot 
##D par(mfrow = c(1,1))
##D 
##D #----------------------------
##D # Examples for: by_labels_branches_col, by_labels_branches_lwd, by_labels_branches_lty
##D 
##D old_labels <- labels(dend)
##D dend %>% 
##D    set("labels", seq_len(nleaves(dend))) %>% 
##D    set("by_labels_branches_col", c(1:4, 7)) %>% 
##D    set("by_labels_branches_lwd", c(1:4, 7)) %>% 
##D    set("by_labels_branches_lty", c(1:4, 7)) %>% 
##D    set("labels", old_labels) %>% 
##D    plot
##D 
##D dend %>% 
##D    set("labels", seq_len(nleaves(dend))) %>% 
##D    set("by_labels_branches_col", c(1:4, 7), type = "any", TF_values = c(4,2)) %>% 
##D    set("by_labels_branches_lwd", c(1:4, 7), type = "all", TF_values = c(4,1)) %>% 
##D    set("by_labels_branches_lty", c(1:4, 7), TF_values = c(4,1)) %>% 
##D    plot
##D 
##D #---- using order_value
##D # This is probably not what you want, since cutree 
##D # returns clusters in the order of the original data:
##D dend %>% set("labels_colors", cutree(dend, k = 3)) %>% plot
##D # The way to fix it, is to use order_value = TRUE
##D # so that value is assumed to be in the order of the data:
##D dend %>% set("labels_colors", cutree(dend, k = 3), order_value = TRUE) %>% plot
##D 
##D 
##D #----------------------------
##D # Example for: by_lists_branches_col, by_lists_branches_lwd, by_lists_branches_lty
##D 
##D L <- list(c("109", "123", "126", "145"), "29", c("59", "67", "97"))
##D dend %>% 
##D    set("by_lists_branches_col", L, TF_value = "blue") %>%
##D    set("by_lists_branches_lwd", L, TF_value = 4) %>%
##D    set("by_lists_branches_lty", L, TF_value = 3) %>%
##D    plot
##D 
##D 
##D #----------------------------
##D # A few dendlist examples:
##D dendlist(dend,dend) %>% set("hang") %>% plot
##D dendlist(dend,dend) %>% set("branches_k_col", k=3) %>% plot
##D dendlist(dend,dend) %>% set("labels_col", c(1,2)) %>% plot
##D 
##D dendlist(dend,dend) %>% 
##D    set("hang") %>%
##D    set("labels_col", c(1,2), which = 1) %>% 
##D    set("branches_k_col", k=3, which = 2) %>%
##D    set("labels_cex", 1.2) %>%
##D    plot
##D 
##D 
##D #----------------------------
##D # example of modifying the dendrogram in a heatmap:
##D 
##D library(gplots)
##D data(mtcars)
##D x  <- as.matrix(mtcars)
##D rc <- rainbow(nrow(x), start=0, end=.3)
##D cc <- rainbow(ncol(x), start=0, end=.3)
##D 
##D ##
##D ##' demonstrate the effect of row and column dendrogram options
##D ##
##D Rowv_dend <- x %>% dist %>% hclust %>% 
##D    as.dendrogram %>% 
##D    set("branches_k", k = 3) %>% 
##D    set("branches_lwd", 2) %>%  ladderize # rotate_DendSer
##D Colv_dend <- t(x) %>% dist %>% hclust %>% 
##D    as.dendrogram %>% 
##D    set("branches_k", k = 3) %>% 
##D    set("branches_lwd", 2) %>%  ladderize # rotate_DendSer
##D heatmap.2(x, Rowv = Rowv_dend, Colv = Colv_dend)  
##D 
##D 
##D 
##D 
##D 
## End(Not run)



