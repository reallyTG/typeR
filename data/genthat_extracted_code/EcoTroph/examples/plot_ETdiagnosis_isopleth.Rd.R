library(EcoTroph)


### Name: plot_ETdiagnosis_isopleth
### Title: Diagnosis Isopleth Plot Function
### Aliases: plot_ETdiagnosis_isopleth
### Keywords: ~EcoTroph ~Diagnosis

### ** Examples

data(ecopath_guinee)
## No test: 
diagn.list=create.ETdiagnosis(create.ETmain(ecopath_guinee))
## End(No test)
## No test: 
plot_ETdiagnosis_isopleth(diagn.list,fleet1='catch.1',fleet2='catch.2')
## End(No test)
## No test: 
plot_ETdiagnosis_isopleth(diagn.list,fleet1='catch.1',fleet2='catch.2',
	relative=TRUE)
## End(No test)



