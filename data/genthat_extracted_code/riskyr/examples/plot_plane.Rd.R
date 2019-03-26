library(riskyr)


### Name: plot_plane
### Title: Plot a plane of selected values (e.g., PPV or NPV) as a function
###   of sensitivity and specificity.
### Aliases: plot_plane

### ** Examples

# Basics:
plot_plane()  # => current defaults (what = "PPV")
plot_plane(what = "PPV")  # => plane of PPV
plot_plane(what = "NPV")  # => plane of NPV
plot_plane(what = "ppod") # => plane of ppod
plot_plane(what = "acc")  # => plane of acc

# Options:
plot_plane(title.lbl = "Testing smaller text labels", cex.lbl = .60)
plot_plane(show.point = FALSE)  # => no point shown on plane
plot_plane(step.size = .333, what.col = "firebrick")  # => coarser granularity + color
plot_plane(step.size = .025, what.col = "chartreuse4")  # => finer granularity + color
plot_plane(what.col = "steelblue4", theta = -90, phi = 45)  # => rotated, from above





