library(riskyr)


### Name: plot_mosaic
### Title: Plot a mosaic plot of population frequencies.
### Aliases: plot_mosaic

### ** Examples

plot_mosaic()                # => default options
plot_mosaic(title.lbl = "")  # => no title
plot_mosaic(vsplit = FALSE)  # => horizontal split
plot_mosaic(title.lbl = "My favorite scenario", col.sdt = "goldenrod")

# Accuracy:
plot_mosaic(show.accu = TRUE)               # => default w = .5 (balanced accuracy "bacc")
plot_mosaic(show.accu = TRUE, w.acc = 1/3)  # => (weighted accuracy "wacc")
plot_mosaic(show.accu = FALSE)              # => no accuracy info.





