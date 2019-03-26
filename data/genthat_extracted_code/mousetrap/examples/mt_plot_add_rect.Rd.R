library(mousetrap)


### Name: mt_plot_add_rect
### Title: Add rectangles to trajectory plot.
### Aliases: mt_plot_add_rect

### ** Examples

# Load ggplot2
library(ggplot2)

# Import, flip, and time-normalize raw trajectories
mt_example <- mt_import_mousetrap(mt_example_raw)
mt_example <- mt_remap_symmetric(mt_example,remap_xpos="no")
mt_example <- mt_time_normalize(mt_example)

# Create rectangles matrix
rectangles <- matrix(
  # (The matrix is n x 4, and contains
  # all relevant data for every button,
  # (i.e. x, y, width and height values)
  # in separate rows)
  c(
   -840, 525,  350, -170,
    840, 525, -350, -170
  ),
  ncol=4, byrow=TRUE)

# Plot all time-normalized trajectories
# varying the color depending on the condition
# and add rectangles
mt_plot(mt_example,
  use="trajectories",
  x="xpos", y="ypos", color="Condition"
) + mt_plot_add_rect(rect=rectangles)





