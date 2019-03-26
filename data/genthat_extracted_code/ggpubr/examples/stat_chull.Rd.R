library(ggpubr)


### Name: stat_chull
### Title: Plot convex hull of a set of points
### Aliases: stat_chull

### ** Examples

# Load data
data("mtcars")
df <- mtcars
df$cyl <- as.factor(df$cyl)

# scatter plot with convex hull
ggscatter(df, x = "wt", y = "mpg", color = "cyl")+
 stat_chull(aes(color = cyl))

ggscatter(df, x = "wt", y = "mpg", color = "cyl")+
 stat_chull(aes(color = cyl, fill = cyl), alpha = 0.1, geom = "polygon")




