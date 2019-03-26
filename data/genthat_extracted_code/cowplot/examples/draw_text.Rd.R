library(cowplot)


### Name: draw_text
### Title: Draw multiple text-strings in one go.
### Aliases: draw_text

### ** Examples

# Draw onto a 1*1 drawing surface
ggdraw() + draw_text("Hello World!", x = 0.5, y = 0.5)
#
# Adorn a plot from the Anscombe data set of "identical" data.
p = qplot(x = x1, y = y1, geom = c("smooth", "point"), data = anscombe)
threeStrings = c("Hello World!", "to be or not to be", "over and out")
p + draw_text(threeStrings, x = 8:10, y = 5:7, hjust = 0)



