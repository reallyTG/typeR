library(eHOF)


### Name: HOF
### Title: Hierarchical logistic regression
### Aliases: HOF HOF.default HOF.data.frame fitted.HOF pick.model
###   pick.model.HOF pick.model.HOF.list predict.HOF print.HOF
###   print.HOF.list
### Keywords: models regression nonlinear

### ** Examples

	data(acre)
	sel <- c('MATRREC', 'RUMEACT', 'SILENOC', 'APHAARV', 'MYOSARV', 'DESUSOP', 'ARTE#VU')
	mo <- HOF(acre[,match(sel, names(acre))], acre.env$PH_KCL, M=1, bootstrap=NULL)
	mo



