library(ggpubr)


### Name: stat_stars
### Title: Add Stars to a Scatter Plot
### Aliases: stat_stars

### ** Examples

# Load data
data("mtcars")
df <- mtcars
df$cyl <- as.factor(df$cyl)

# Scatter plot with ellipses and group mean points
ggscatter(df, x = "wt", y = "mpg",
   color = "cyl", shape = "cyl",
   mean.point = TRUE, ellipse = TRUE)+
 stat_stars(aes(color = cyl))




