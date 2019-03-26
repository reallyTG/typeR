library(MPDiR)


### Name: Grue
### Title: Distribution of Grue Languages with UV-B Exposure
### Aliases: Grue
### Keywords: datasets

### ** Examples

data(Grue)
barplot(t(as.matrix(Grue[, -1])), names.arg = round(Grue$UV_B, 1), 
	beside = TRUE, legend.text = c("blue-green", "grue", "dark"),
	col = c("white", "grey", "black"),
	ylim = c(0, 40), cex.lab = 1.5,
	xlab = expression(paste("Average UV-B (kJ/", m^2, ")")),
	ylab = "Numbers of Languages"
	)




