library(ibelief)


### Name: FMTfunctions
### Title: Fast Mobius Transform
### Aliases: beltob beltom beltopl beltoq btobel btom btopl btoq btov mtob
###   mtobel mtobetp mtonm mtopl mtoq mtov mtow pltob pltobel pltom pltoq
###   qtom qtow vtob vtom wtom wtoq

### ** Examples

	Mass=RandomMass(nbFocalElement=3, ThetaSize=3, nbMass=4, Type=1)
	mass=mtobel(Mass)
	qvec=mtoq(mass)
	mass=qtom(qvec)



