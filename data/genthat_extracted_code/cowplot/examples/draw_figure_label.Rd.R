library(cowplot)


### Name: draw_figure_label
### Title: Add a label to a figure
### Aliases: draw_figure_label

### ** Examples


p1 <- qplot(1:10, 1:10)
p2 <- qplot(1:10, (1:10)^2)
p3 <- qplot(1:10, (1:10)^3)
p4 <- qplot(1:10, (1:10)^4)

# Create a simple grid
p <- plot_grid(p1, p2, p3, p4, align = 'hv')

# Default font size and position
p + draw_figure_label(label = "Figure 1")

# Different position and font size
p + draw_figure_label(label = "Figure 1", position = "bottom.right", size = 10)

# Using bold font face
p + draw_figure_label(label = "Figure 1", fontface = "bold")

# Making the label red and slanted
p + draw_figure_label(label = "Figure 1", angle = -45, colour = "red")

# Labeling an individual plot
ggdraw(p2) + draw_figure_label(label = "Figure 1", position = "bottom.right", size = 10)




