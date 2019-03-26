library(multipanelfigure)


### Name: multi_panel_figure
### Title: multi_panel_figure
### Aliases: multi_panel_figure multipanelfigure
### Keywords: hplot utilities

### ** Examples

# Figure construction based on the dimensions of the current device
figure1 <- multi_panel_figure(
   columns = 2,
   rows = 2,
   figure_name = "figure1")

# With no panels, printing shows the layout
figure1

# Figure construction based on overall dimensions
figure2 <- multi_panel_figure(
   width = 100,
   columns = 4,
   height = 90,
   rows = 6,
   figure_name = "figure2")

# Still no panels ...
figure2

# Figure construction based on individual panel dimensions
(figure3 <- multi_panel_figure(
   width = c(40,30),
   height = c(40,60),
   row_spacing = c(5, 1),
   column_spacing = c(0, 10),
   figure_name = "figure3"))

# A more involved example including filling and printing to device ...
# Make a simple ggplot object to fill panels
ggp <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
  ggplot2::geom_point()
# Fill panels
# ggplots and lattice plot objects are added directly
# The default position is the top-left panel
figure3 <- fill_panel(figure3, ggp)
# Raster images are added by passing the path to their file
jpg <- system.file("extdata/rhino.jpg", package = "multipanelfigure")
figure3 <- fill_panel(figure3, jpg, column = 2)
# Plots can take up multiple panels
figure3 <- fill_panel(figure3, ggp, row = 2, column = 1:2)
# Plot to appropriately sized png device
tmpFile <- tempfile(fileext = ".png")
ggplot2::ggsave(
  tmpFile, figure3,
  width = figure_width(figure3, "in"),
  height = figure_height(figure3, "in"))
message(
  paste0("Now have a look at '",tmpFile,"' - nicely sized PNG output."))
## No test: 
 # Not testing due to use of external software
utils::browseURL(tmpFile)
## End(No test)



