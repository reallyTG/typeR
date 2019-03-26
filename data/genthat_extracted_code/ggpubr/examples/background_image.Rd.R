library(ggpubr)


### Name: background_image
### Title: Add Background Image to ggplot2
### Aliases: background_image

### ** Examples

## Not run: 
##D install.packages("png")
##D 
##D # Import the image
##D img.file <- system.file(file.path("images", "background-image.png"),
##D                        package = "ggpubr")
##D img <- png::readPNG(img.file)
##D 
##D # Plot with background image
##D ggplot(iris, aes(Species, Sepal.Length))+
##D  background_image(img)+
##D  geom_boxplot(aes(fill = Species), color = "white")+
##D  fill_palette("jco")
##D  
## End(Not run)




