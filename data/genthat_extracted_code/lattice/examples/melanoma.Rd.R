library(lattice)


### Name: H_melanoma
### Title: Melanoma skin cancer incidence
### Aliases: melanoma
### Keywords: datasets

### ** Examples

# Time-series plot.  Figure 3.64 from Cleveland.
xyplot(incidence ~ year,
  data = melanoma,
	aspect = "xy",
	panel = function(x, y)
		panel.xyplot(x, y, type="o", pch = 16),
	ylim = c(0, 6),
	xlab = "Year",
	ylab = "Incidence")



