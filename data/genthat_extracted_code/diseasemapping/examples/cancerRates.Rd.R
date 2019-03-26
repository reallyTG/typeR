library(diseasemapping)


### Name: cancerRates
### Title: Download cancer incidence rates from the International Agency
###   for Research on Cancer (IARC)
### Aliases: cancerRates

### ** Examples


# won't work if offline or if the iarc web site is down

if(interactive() | Sys.info()['user'] =='patrick') {	 
  qcLungF=cancerRates(area="canada", year=2001:2002, site="lung", sex="F")
} else {
	qcLungF = structure(c(0, 5e-06, 0, 0, 5e-06, 1e-05, 0, 3.4e-05, 9.6e-05, 
0.000211, 0.000559, 0.001289, 0.002003, 0.002508, 0.002728, 0.003189, 
0.002792, 0.001905), .Names = c("F_0", "F_5", "F_10", "F_15", 
"F_20", "F_25", "F_30", "F_35", "F_40", "F_45", "F_50", "F_55", 
"F_60", "F_65", "F_70", "F_75", "F_80", "F_85"), site = "Lung", 
area = "Canada", year = "2001-2002")
}
qcLungF

data('popdata')

qcLungExp = getSMR(popdata, qcLungF)

names(qcLungExp)

if(require('mapmisc', quietly=TRUE)) {

	mycol = colourScale(qcLungExp$expected, 
		breaks=9, dec=0, transform='log', style='equal')
	plot(popdata[1:400,])
	plot(qcLungExp, col=mycol$plot, border='#00000040',add=TRUE)
	legendBreaks('topright', mycol)
}




