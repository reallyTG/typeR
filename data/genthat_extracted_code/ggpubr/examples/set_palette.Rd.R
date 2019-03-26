library(ggpubr)


### Name: set_palette
### Title: Set Color Palette
### Aliases: set_palette change_palette color_palette fill_palette

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot
p <- ggboxplot(df, x = "dose", y = "len",
   color = "dose")
p

# Change the color palette
set_palette(p, "jco")



