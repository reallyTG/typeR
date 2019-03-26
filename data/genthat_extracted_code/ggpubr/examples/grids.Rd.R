library(ggpubr)


### Name: grids
### Title: Add Grids to a ggplot
### Aliases: grids

### ** Examples

# Load data
data("ToothGrowth")

# Basic plot
p <- ggboxplot(ToothGrowth, x = "dose", y = "len")
p

# Add border
p + grids(linetype = "dashed")



