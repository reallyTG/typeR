library(ggpubr)


### Name: stat_cor
### Title: Add Correlation Coefficients with P-values to a Scatter Plot
### Aliases: stat_cor

### ** Examples

# Load data
data("mtcars")
df <- mtcars
df$cyl <- as.factor(df$cyl)

# Scatter plot with correlation coefficient
#:::::::::::::::::::::::::::::::::::::::::::::::::
sp <- ggscatter(df, x = "wt", y = "mpg",
   add = "reg.line",  # Add regressin line
   add.params = list(color = "blue", fill = "lightgray"), # Customize reg. line
   conf.int = TRUE # Add confidence interval
   )
# Add correlation coefficient
sp + stat_cor(method = "pearson", label.x = 3, label.y = 30)

# Use R2 instead of R
ggscatter(df, x = "wt", y = "mpg", add = "reg.line") +
 stat_cor(
   aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~")),
  label.x = 3
)

# Color by groups and facet
#::::::::::::::::::::::::::::::::::::::::::::::::::::
sp <- ggscatter(df, x = "wt", y = "mpg",
   color = "cyl", palette = "jco",
   add = "reg.line", conf.int = TRUE)
sp + stat_cor(aes(color = cyl), label.x = 3)




