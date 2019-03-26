library(qdap)


### Name: Dissimilarity
### Title: Dissimilarity Statistics
### Aliases: Dissimilarity
### Keywords: dissimilarity

### ** Examples

## Not run: 
##D with(DATA, Dissimilarity(state, list(sex, adult)))
##D with(DATA, Dissimilarity(state, person, diag = TRUE))
##D 
##D ## Clustering: Dendrogram
##D (x <- with(pres_debates2012, Dissimilarity(dialogue, list(person, time))))
##D fit <- hclust(x)
##D plot(fit)
##D ## draw dendrogram with red borders around the 3 clusters 
##D rect.hclust(fit, k=3, border=c("red", "purple", "seagreen"))
##D 
##D ## Clustering: Dendrogram with p.values
##D library(pvclust)
##D wfm.mod <- with(pres_debates2012, wfm(dialogue, list(person, time)))
##D fit <- suppressMessages(pvclust(wfm.mod, method.hclust="ward",
##D     method.dist="euclidean"))
##D plot(fit) 
##D pvrect(fit, alpha=.95)
##D 
##D ## Multidimentional Scaling
##D ## Based on blog post from Bodong Chen
##D ## http://bodongchen.com/blog/?p=301
##D 
##D ## Fit it: 2-D
##D (diss <- with(pres_debates2012, Dissimilarity(dialogue, list(person, time), 
##D     method = "euclidean")))
##D fit <- cmdscale(diss, eig = TRUE, k = 2)
##D 
##D ## Plot it 2-D
##D points <- data.frame(x = fit$points[, 1], y = fit$points[, 2])
##D ggplot(points, aes(x = x, y = y)) + 
##D     geom_point(data = points, aes(x = x, y = y, color = rownames(points))) + 
##D     geom_text(data = points, aes(x = x, y = y - 0.2, label = row.names(points)))
##D     
##D ## Fit it: 3-D
##D library(scatterplot3d)
##D fit <- cmdscale(diss, eig = TRUE, k = 3)
##D 
##D points <- data.frame(colSplit(names(fit$points[, 1])))
##D library(qdapTools)
##D points$colors <- points$X1 %l% data.frame(levels(points$X1), 
##D     qcv(yellow, yellow, blue, yellow, red, yellow))
##D points$shape <- points$X2 %l% data.frame(levels(points$X2), c(15, 17, 19))
##D 
##D ## Plot it: 3-D
##D scatterplot3d(fit$points[, 1], fit$points[, 2], fit$points[, 3], 
##D     color = points$colors, pch = points$shape, 
##D     main = "Semantic Space Scaled to 3D", xlab = "x", ylab = "y", 
##D     zlab = "z", type = "h")
##D 
##D legend("bottomright", title="Person",
##D    qcv(Obama, Romney, Other), fill=qcv(blue, red, yellow))
##D legend("topleft",  paste("Time", 1:3), pch=c(15, 17, 19))
##D 
##D ## Compare to Cosine Similarity
##D cos_sim <- function(x, y) x %*% y / sqrt(x%*%x * y%*%y)
##D mat <- matrix(rbinom(500, 0:1, .45), ncol=10)
##D v_outer(mat, cos_sim)
##D 
##D v_outer(with(DATA, wfm(state, person)), cos_sim)
##D with(DATA, Dissimilarity(state, person))
## End(Not run)



