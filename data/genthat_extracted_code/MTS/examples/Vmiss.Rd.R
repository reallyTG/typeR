library(MTS)


### Name: Vmiss
### Title: VARMA Model with Missing Value
### Aliases: Vmiss

### ** Examples

	data("mts-examples",package="MTS")
	gdp=log(qgdp[,3:5])
	m1=VAR(gdp,3)
	piwgt=m1$Phi; Sig=m1$Sigma; cnst=m1$Ph0
	m2=Vmiss(gdp,piwgt,Sig,50,cnst)



