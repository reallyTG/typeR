library(ggpubr)


### Name: ggpar
### Title: Graphical parameters
### Aliases: ggpar

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic box plot
# +++++++++++++++++++++++++++

p <- ggboxplot(df, x = "dose", y = "len")

# Change the plot orientation: horizontal
ggpar(p, orientation = "horiz")


 # Change main title and axis labels
 # ++++++++++++++++++++++++++++

 ggpar(p,
   main = "Plot of length \n by dose",
   xlab = "Dose (mg)", ylab = "Length")

 # Title font styles: 'plain', 'italic', 'bold', 'bold.italic'
 ggpar(p,
   main = "Length by dose",
   font.main = c(14,"bold.italic", "red"),
   font.x = c(14, "bold", "#2E9FDF"),
   font.y = c(14, "bold", "#E7B800"))

 # Hide axis labels
 ggpar(p, xlab = FALSE, ylab = FALSE)


# Change colors
# ++++++++++++++++++++++

# Change outline colors by groups: dose
 p2 <- ggboxplot(df, "dose", "len", color = "dose")
 p2

# Use custom color palette
ggpar(p2, palette = c("#00AFBB", "#E7B800", "#FC4E07"))

# Use brewer palette
ggpar(p2, palette = "Dark2" )

# Use grey palette
ggpar(p2, palette = "grey")

# Use scientific journal palette from ggsci package
ggpar(p2, palette = "npg") # nature

# Axis ticks, limits, scales
# +++++++++++++++++++++++++

# Axis ticks labels and rotation
ggpar(p,
 font.tickslab = c(14,"bold", "#993333"),
 xtickslab.rt = 45, ytickslab.rt = 45)
# Hide axis ticks and tick labels
ggpar(p, ticks = FALSE, tickslab = FALSE)

# Axis limits
ggpar(p, ylim = c(0, 50))

# Axis scale
ggpar(p, yscale = "log2")

# Format axis scale
ggpar(p, yscale = "log2", format.scale = TRUE)

# Legends
# ++++++++++++++++++
# Change legend position and title
ggpar(p2,
 legend = "right", legend.title = "Dose (mg)",
 font.legend = c(10, "bold", "red"))




