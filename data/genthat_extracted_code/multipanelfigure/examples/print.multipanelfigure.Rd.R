library(multipanelfigure)


### Name: print.multipanelfigure
### Title: Print a multi-panel figure
### Aliases: print.multipanelfigure

### ** Examples

p <- lattice::xyplot(dist ~ speed, cars)
figure <- multi_panel_figure(
  width = 100, height = 100,
  rows = 1, columns = 1
)
# With no panels, printing shows the layout
print(figure)
figure <- fill_panel(figure, p)
# After a panel is added, printing shows the plot.
print(figure) # shows plot



