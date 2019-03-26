library(RCA)


### Name: RCA-package
### Title: Relational Class Analysis
### Aliases: RCA print.RCA plot.RCA
### Keywords: package

### ** Examples

# Test matrix
set.seed <- 2
matrix <- round(matrix(runif(100, min = 0, max = 6), 
  ncol = 5))

rca <- RCA(matrix)
rca <- RCA(matrix, max = rep(6, 5), min = rep(0, 5))
rca <- RCA(matrix, max = 6, min = 0)
rca <- RCA(matrix, num = 10000, alpha = 0.1)

summary(rca)
print(rca)

rca$membership
rca$modules[[1]]$matrix
rca$R

# Heatmap
plot(rca, module = 1)
plot(rca, module = 1, colorblind = TRUE, 
  heat_labels = TRUE)

# IGraph
plot(rca, module = 1, heatmap = FALSE)
plot(rca, module = 1, heatmap = FALSE, 
  layout = layout.circle, edge_color = "red", 
  vertex_color = "gray", vertex_frame_color = "red", 
  vertex_size = 30, vertex_label_color= "red", 
  vertex_label_cex = 1, margin = 0.2)



