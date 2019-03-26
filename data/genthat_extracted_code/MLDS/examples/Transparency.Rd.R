library(MLDS)


### Name: Transparency
### Title: Difference Scaling of Transparency
### Aliases: Transparency
### Keywords: datasets

### ** Examples

	
Trsp.mlds <- mlds(as.mlds.df(Transparency[, -6], st = attr(Transparency, "stimulus")))
plot(Trsp.mlds, xlab = "Index of Refraction", type = "l",
	ylab = "Difference Scale", ylim = c(0, 20),
	lwd = 3)

Trsp.Obs <- sapply(levels(Transparency$Obs), function(obs)
	mlds(as.mlds.df(subset(Transparency, Obs == obs, 
		select = 1:5), st = attr(Transparency, "stimulus"))),
		simplify = FALSE, USE.NAMES = TRUE)
invisible(sapply(Trsp.Obs, lines, type = "b"))





