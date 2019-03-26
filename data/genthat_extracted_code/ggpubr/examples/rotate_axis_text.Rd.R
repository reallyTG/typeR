library(ggpubr)


### Name: rotate_axis_text
### Title: Rotate Axes Text
### Aliases: rotate_axis_text rotate_x_text rotate_axis_text rotate_y_text

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot
p <- ggboxplot(df, x = "dose", y = "len")
p
# Vertical x axis text
p + rotate_x_text()
# Set rotation angle to 45
p + rotate_x_text(45)
p + rotate_y_text(45)




