library(mdpeer)


### Name: vizu.mat
### Title: Visualize matrix data in a form of a heatmap, with continuous
###   values legend
### Aliases: vizu.mat

### ** Examples

mat <- matrix(rnorm(30*30), nrow = 30, ncol = 30)
vizu.mat(mat)
vizu.mat(mat, fill.scale.limits = c(-3,3))
vizu.mat(mat, fill.scale.limits = c(-10,10))
vizu.mat(mat, fill.scale.limits = c(-10,10), 
         uniform.labes = TRUE, clear.labels = FALSE)
colnames(mat) <- paste0("col", 1:30, sample(LETTERS, 30, replace = TRUE))
rownames(mat) <- paste0("row", 1:30, sample(LETTERS, 30, replace = TRUE))
vizu.mat(mat, fill.scale.limits = c(-10,10), 
         clear.labels = FALSE, 
         rotate.x.labels = TRUE)
mat.positive <- abs(mat)
vizu.mat(mat.positive, 
         title = "positive values only -> legend limits and colors automatically adjusted",
         clear.labels = FALSE, 
         rotate.x.labels = TRUE)




