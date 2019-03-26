library(eHOF)


### Name: plot.HOF
### Title: Plot Hierarchical Logistic Regression Models
### Aliases: plot.HOF plot.HOF.list
### Keywords: model

### ** Examples

	data(acre)
	sel <- c('MATRREC', 'RUMEACT', 'SILENOC', 'APHAARV', 'MYOSARV', 'DESUSOP', 'ARTE#VU')
	mo <- HOF(acre[match(sel, names(acre))], acre.env$PH_KCL, M=1, bootstrap=NULL)
	par(mar=c(2,2,1,.1))
	plot(mo, para=TRUE)

# An example for plottype='all' to show species responses for the species within 
# the most acidic and the most calcareous vegetation plot.
	## Not run: 
##D 	allSpeciesFromAnAcidicPlot <- acre['57',] > 0
##D 	mods.acidic <- HOF(acre[,allSpeciesFromAnAcidicPlot],acre.env$PH_KCL,M=1,bootstrap=NULL)
##D 	allSpeciesFromAnCalcareousPlot <- acre['87',] > 0
##D 	mods.calc <- HOF(acre[,allSpeciesFromAnCalcareousPlot],acre.env$PH_KCL,M=1,bootstrap=NULL)
##D 	
##D 	autolayout(2)
##D 	plot(mods.acidic, plottype='all', main='Plot with low pH')
##D 	abline(v=acre.env$PH_KCL[acre.env$RELEVE_NR == '57])
##D   names(mods.acidic)
##D 	
##D 	plot(mods.calc, plottype='all', main='Plot with high pH')
##D 	abline(v=acre.env$PH_KCL[acre.env$RELEVE_NR == '87'])
##D   names(mods.calc)
##D 	
## End(Not run)



