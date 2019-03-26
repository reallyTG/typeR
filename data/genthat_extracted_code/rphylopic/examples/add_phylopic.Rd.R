library(rphylopic)


### Name: add_phylopic
### Title: Input an image and create a ggplot2 layer to add to an existing
###   plot
### Aliases: add_phylopic

### ** Examples

## Not run: 
##D # Put a silhouette behind a plot
##D library(ggplot2)
##D img <- image_data("27356f15-3cf8-47e8-ab41-71c6260b2724", size = "512")[[1]]
##D qplot(x=Sepal.Length, y=Sepal.Width, data=iris, geom="point") + 
##D   add_phylopic(img)
##D 
##D # Put a silhouette anywhere
##D library(ggplot2)
##D posx <- runif(50, 0, 10)
##D posy <- runif(50, 0, 10)
##D sizey <- runif(50, 0.4, 2)
##D cols <- sample(c("black", "darkorange", "grey42", "white"), 50, 
##D   replace = TRUE)
##D 
##D cat <- image_data("23cd6aa4-9587-4a2e-8e26-de42885004c9", size = 128)[[1]]
##D (p <- ggplot(data.frame(cat.x = posx, cat.y = posy), aes(cat.x, cat.y)) + 
##D  geom_point(color = rgb(0,0,0,0)))
##D for (i in 1:50) {
##D   p <- p + add_phylopic(cat, 1, posx[i], posy[i], sizey[i], cols[i])
##D }
##D p + ggtitle("R Cat Herd!!")
## End(Not run)



