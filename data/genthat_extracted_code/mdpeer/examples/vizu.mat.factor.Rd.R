library(mdpeer)


### Name: vizu.mat.factor
### Title: Visualize matrix data in a form of a heatmap, with categorical
###   values legend
### Aliases: vizu.mat.factor

### ** Examples

mat <- diag(30)
vizu.mat.factor(mat)
vizu.mat.factor(mat, 
                title = "some title",
                scale_fill_manual.values = c("white","red"),
                axis.text.x.breaks.idx = seq(1,30,5),
                axis.text.y.breaks.idx = seq(1,30,5))
vizu.mat.factor(mat, 
                title = "some title: large font, legend: small font",
                base_size = 20, 
                legend.text.size  = 10, 
                legend.title.size = 10)
vizu.mat.factor(mat, 
                scale_fill_manual.values = c("white","red"),
                clear.labels = FALSE) 
colnames(mat) <- paste0("col", 1:30, sample(LETTERS, 30, replace = TRUE))
rownames(mat) <- paste0("row", 1:30, sample(LETTERS, 30, replace = TRUE))
vizu.mat.factor(mat, 
                clear.labels = FALSE,
                rotate.x.labels = TRUE) 




