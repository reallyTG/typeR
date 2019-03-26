library(ggpubr)


### Name: theme_transparent
### Title: Create a ggplot with Transparent Background
### Aliases: theme_transparent

### ** Examples

# Create a scatter plot
sp <- ggscatter(iris, x = "Sepal.Length", y = "Sepal.Width",
               color = "Species", palette = "jco",
               size = 3, alpha = 0.6)
sp

# Transparent theme
sp + theme_transparent()




