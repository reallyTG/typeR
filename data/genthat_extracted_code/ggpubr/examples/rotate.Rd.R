library(ggpubr)


### Name: rotate
### Title: Rotate a ggplot Horizontally
### Aliases: rotate

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot
p <- ggboxplot(df, x = "dose", y = "len",
   color = "dose", palette = "jco")
p
# Create horizontal plots
p + rotate()



