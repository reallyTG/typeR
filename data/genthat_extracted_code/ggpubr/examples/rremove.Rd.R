library(ggpubr)


### Name: rremove
### Title: Remove a ggplot Component
### Aliases: rremove

### ** Examples

# Load data
data("ToothGrowth")

# Basic plot
p <- ggboxplot(ToothGrowth, x = "dose", y = "len",
  ggtheme = theme_gray())
p

# Remove all grids
p + rremove("grid")

# Remove only x grids
p + rremove("x.grid")



