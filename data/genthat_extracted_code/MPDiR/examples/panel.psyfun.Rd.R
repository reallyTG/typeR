library(MPDiR)


### Name: panel.psyfun
### Title: Panel Function for Adding Psychometric Function Fit to Each
###   Panel
### Aliases: panel.psyfun
### Keywords: hplot dplot aplot

### ** Examples

lattice::xyplot(Pc ~ Phaseshift | WaveForm + TempFreq + 
	Direction, Vernier, layout = c(4, 2),
	panel = function(x, y, n = 20, ...) {
		lattice::panel.xyplot(x, y)
		panel.psyfun(x, y, 20, lnk = "probit")
	}
)




