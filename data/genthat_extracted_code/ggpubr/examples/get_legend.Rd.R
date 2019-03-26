library(ggpubr)


### Name: get_legend
### Title: Extract Legends from a ggplot object
### Aliases: get_legend

### ** Examples

# Create a scatter plot
p <- ggscatter(iris, x = "Sepal.Length", y = "Sepal.Width",
        color = "Species", palette = "jco",
        ggtheme = theme_minimal())
p

# Extract the legend. Returns a gtable
leg <- get_legend(p)

# Convert to a ggplot and print
as_ggplot(leg)




