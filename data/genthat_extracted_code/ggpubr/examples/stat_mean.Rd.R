library(ggpubr)


### Name: stat_mean
### Title: Draw group mean points
### Aliases: stat_mean

### ** Examples

# Load data
data("mtcars")
df <- mtcars
df$cyl <- as.factor(df$cyl)

# Scatter plot with ellipses and group mean points
ggscatter(df, x = "wt", y = "mpg",
   color = "cyl", shape = "cyl", ellipse = TRUE)+
 stat_mean(aes(color = cyl, shape = cyl), size = 4)




