library(multipanelfigure)


### Name: save_multi_panel_figure
### Title: save_multi_panel_figure
### Aliases: save_multi_panel_figure

### ** Examples

# Create the figure layout
(figure <- multi_panel_figure(
  width = c(30,40,60),
  height = c(40,60,60,60),
  panel_label_type = "upper-roman"))

# Fill the top-left panel using a grob object directly
a_grob <- grid::linesGrob(arrow = grid::arrow())
figure %<>% fill_panel(a_grob)

## Not run: 
##D # Save the figure
##D figure %>%
##D   save_multi_panel_figure(
##D     filename = paste0(
##D     tempfile(),
##D     ".png"))
## End(Not run)



