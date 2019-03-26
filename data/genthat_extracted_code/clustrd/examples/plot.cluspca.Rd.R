library(clustrd)


### Name: plot.cluspca
### Title: Plotting function for 'cluspca()' output.
### Aliases: plot.cluspca

### ** Examples

data("macro")
#Factorial K-means (3 clusters in 2 dimensions) after 100 random starts
outFKM = cluspca(macro, 3, 2, method = "FKM", rotation = "varimax")
#Scatterplot (dimensions 1 and 2) and cluster description plot
plot(outFKM, cludesc = TRUE)

data("iris", package = "datasets")
#Compromise solution between PCA and Reduced K-means
#on the iris dataset (3 clusters in 2 dimensions) after 100 random starts
outclusPCA = cluspca(iris[,-5], 3, 2, alpha = 0.3, rotation = "varimax")
table(outclusPCA$cluster,iris[,5])
#Save the ggplot2 scatterplot
map = plot(outclusPCA)$map
#Customization (adding titles)
map + ggtitle(paste("A compromise solution between RKM and FKM on the iris: 
3 clusters of sizes ", paste(outclusPCA$size, 
collapse = ", "),sep = "")) + xlab("Dimension 1") + ylab("Dimension 2") + 
theme(plot.title = element_text(size = 10, face = "bold", hjust = 0.5))



