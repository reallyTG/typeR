library(dendextend)


### Name: highlight_branches_col
### Title: Highlight a dendrogram's branches heights via color and
###   line-width
### Aliases: highlight_branches_col highlight_branches_lwd
###   highlight_branches

### ** Examples



dat <- iris[1:20,-5]
hca <- hclust(dist(dat))
hca2 <- hclust(dist(dat), method = "single")
dend <- as.dendrogram(hca)
dend2 <- as.dendrogram(hca2)

par(mfrow = c(1,3))
dend %>% highlight_branches_col %>% plot(main = "Coloring branches")
dend %>% highlight_branches_lwd %>% plot(main = "Emphasizing line-width")
dend %>% highlight_branches %>% plot(main = "Emphasizing color\n and line-width")

library(viridis)
par(mfrow = c(1,3))
dend %>% highlight_branches_col %>% plot(main = "Coloring branches \n(default is reversed viridis)")
dend %>% highlight_branches_col(viridis(100)) %>% 
   plot(main = "It is better to use\nlighter colors in the leaves")
dend %>% highlight_branches_col(rev(magma(1000))) %>% 
   plot(main = "The magma color pallatte\n is also good")

dl <- dendlist(dend, dend2) 
tanglegram(dl, sort = TRUE, common_subtrees_color_lines = FALSE, 
highlight_distinct_edges  = FALSE, highlight_branches_lwd = FALSE)
tanglegram(dl)
tanglegram(dl, fast = TRUE)

dl <- dendlist(highlight_branches(dend), highlight_branches(dend2))
tanglegram(dl, sort = TRUE, common_subtrees_color_lines = FALSE, highlight_distinct_edges  = FALSE)

dend %>% set("highlight_branches_col") %>% plot

dl <- dendlist(dend, dend2) %>% set("highlight_branches_col") 
tanglegram(dl, sort = TRUE, common_subtrees_color_lines = FALSE, highlight_distinct_edges  = FALSE)


# This is also useful for heatmaps
# --------------------------
# library(dendextend)

x  <- as.matrix(datasets::mtcars)

Rowv  <- x %>% dist %>% hclust %>% as.dendrogram %>%
   set("branches_k_color", k = 3) %>% set("highlight_branches_lwd") %>%
   ladderize
#    rotate_DendSer(ser_weight = dist(x))
Colv  <- x %>% t %>% dist %>% hclust %>% as.dendrogram %>%
   set("branches_k_color", k = 2) %>% set("highlight_branches_lwd") %>%
   ladderize
#    rotate_DendSer(ser_weight = dist(t(x)))

library(gplots)
heatmap.2(x, Rowv = Rowv, Colv = Colv)




