library(MPTinR)


### Name: prediction.plot
### Title: Plot observed versus predicted values for categorical data.
### Aliases: prediction.plot

### ** Examples

## Not run: 
##D #### using the model and data from Broeder & Schuetz:
##D data(d.broeder, package = "MPTinR")
##D m.2htm <- system.file("extdata", "5points.2htm.model", package = "MPTinR")
##D m.sdt <- "pkg/MPTinR/inst/extdata/broeder.sdt.model"
##D 
##D m.sdt <- system.file("extdata", "broeder.sdt.model", package = "MPTinR")
##D 
##D # fit the 2HTM
##D br.2htm <- fit.mpt(d.broeder, m.2htm)
##D 
##D # graphical parameters
##D par(mfrow = c(2,2))
##D prediction.plot(br.2htm, m.2htm, 4)
##D prediction.plot(br.2htm, m.2htm, 4, ylim = c(-4, 4), numbers = NULL, 
##D 	args.points = list(pch = 16, cex = 1.5))
##D prediction.plot(br.2htm, m.2htm, 4, ylim = c(-4, 4), args.plot = list(main = "Dataset 4 - A"),
##D 	abline = TRUE, numbers = "continuous")
##D prediction.plot(br.2htm, m.2htm, 4, ylim = c(-4, 4), args.plot = list(main = "Dataset 4 - B"),
##D 	pos.numbers = "axis", abline = TRUE, 
##D 	args.numbers = list(mgp = c(3, 0.2, 0), cex.axis = 0.35),
##D 	args.points = list(pch = 4, cex = 1.5))
##D dev.off()
##D 
##D prediction.plot(br.2htm, m.2htm, "aggregated", axis.labels = unlist(lapply(c(10, 25, 50, 75, 90),
##D 	paste, c("o.o", "o.n"), sep = "")))
##D 
##D # fit the SDT
##D br.sdt <- fit.model(d.broeder, m.sdt, lower.bound = c(rep(-Inf, 5), 0, 1), upper.bound = Inf)
##D 
##D axis.labels <- unlist(lapply(c(10, 25, 50, 75, 90), paste, c("o.o", "o.n"), sep = ""))
##D # compare predictions for aggregated data:
##D par(mfrow = c(2,2))
##D prediction.plot(br.2htm, m.2htm, "aggregated", ylim = c(-30, 30), 
##D 	args.plot = list(main = "MPT model - absolute"), axis.labels = axis.labels)
##D prediction.plot(br.sdt, m.2htm, "aggregated", ylim = c(-30, 30),
##D 	args.plot = list(main = "SDT model - absolute"), axis.labels = axis.labels)
##D prediction.plot(br.2htm, m.2htm, "aggregated", ylim = c(-60, 60), 
##D 	args.plot = list(main = "MPT model - G.squared"), absolute = FALSE, 
##D 	axis.labels = axis.labels, pos.numbers = "axis", args.points = list(pch = 8, cex = 1))
##D prediction.plot(br.sdt, m.2htm, "aggregated", ylim = c(-60, 60),
##D 	args.plot = list(main = "SDT model - G.squared"), absolute = FALSE, 
##D 	axis.labels = axis.labels, pos.numbers = "axis", args.points = list(pch = 8, cex = 1))
##D 
##D # comparing absoulte and G-sqaured plot with zero counts in cell 2:
##D par(mfrow = c(2,2))
##D prediction.plot(br.2htm, m.2htm, 2, ylim = c(-1, 1),
##D 	args.plot = list(main = "MPT model - absolute"))
##D prediction.plot(br.sdt, m.2htm, 2, ylim = c(-1, 1),
##D 	args.plot = list(main = "SDT model - absolute"))
##D prediction.plot(br.2htm, m.2htm, 2, ylim = c(-2, 2),
##D 	args.plot = list(main = "MPT model - G.squared"), absolute = FALSE)
##D prediction.plot(br.sdt, m.2htm, 2, ylim = c(-2, 2),
##D 	args.plot = list(main = "SDT model - G.squared"), absolute = FALSE)
## End(Not run)




