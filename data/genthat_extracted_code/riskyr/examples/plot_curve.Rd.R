library(riskyr)


### Name: plot_curve
### Title: Plot curves of selected values (e.g., PPV or NPV) as a function
###   of prevalence.
### Aliases: plot_curve

### ** Examples

# Basics:
plot_curve()                     # => default: what = ("prev", "PPV", "NPV")
plot_curve(show.points = FALSE)  # => default without points

# all curves:
plot_curve(what = "all") # => all curves: what = ("prev", "PPV", "NPV", "ppod", "acc")
plot_curve(what = "all", show.points = FALSE)  # => all curves, no points

# selected curves:
plot_curve(what = c("PPV", "NPV"))                  # => PPV and NPV
plot_curve(what = c("prev", "PPV", "NPV", "acc"))   # => prev, PPV, NPV, and acc
plot_curve(what = c("prev", "PPV", "NPV", "ppod"))  # => prev, PPV, NPV, and acc

# X-axis as linear vs. log scale:
plot_curve(prev = .01, sens = .9, spec = .8)                     # => linear scale
plot_curve(prev = .01, sens = .9, spec = .8, log.scale = TRUE)   # => log scale

plot_curve(prev = .0001, sens = .7, spec = .6)                   # => linear scale
plot_curve(prev = .0001, sens = .7, spec = .6, log.scale = TRUE) # => log scale

# Other options:
plot_curve(title.lbl = "Testing smaller text labels", cex.lbl = .60)
plot_curve(what = "all", what.col = c("grey", "red3", "green3", "blue3", "gold"))





