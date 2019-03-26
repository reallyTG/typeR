library(ggpubr)


### Name: gradient_color
### Title: Set Gradient Color
### Aliases: gradient_color gradient_fill

### ** Examples

df <- mtcars
p <- ggscatter(df, x = "wt", y = "mpg",
               color = "mpg")

# Change gradient color
# Use one custom color
p + gradient_color("red")

# Two colors
p + gradient_color(c("blue",  "red"))

# Three colors
p + gradient_color(c("blue", "white", "red"))

# Use RColorBrewer palette
p + gradient_color("RdYlBu")

# Use ggsci color palette
p + gradient_color("npg")



