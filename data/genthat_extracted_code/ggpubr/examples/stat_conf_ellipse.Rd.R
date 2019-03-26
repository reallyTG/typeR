library(ggpubr)


### Name: stat_conf_ellipse
### Title: Plot confidence ellipses.
### Aliases: stat_conf_ellipse

### ** Examples

# Load data
data("mtcars")
df <- mtcars
df$cyl <- as.factor(df$cyl)

# scatter plot with confidence ellipses
ggscatter(df, x = "wt", y = "mpg", color = "cyl")+
 stat_conf_ellipse(aes(color = cyl))

ggscatter(df, x = "wt", y = "mpg", color = "cyl")+
 stat_conf_ellipse(aes(color = cyl, fill = cyl), alpha = 0.1, geom = "polygon")




