library(StrainRanking)


### Name: ranking.strains
### Title: Method for ranking pathogen strains
### Aliases: ranking.strains
### Keywords: misc

### ** Examples

## Application of the ranking method to a real data set
data(powderymildew)
DGdata=DGobj.rawdata(demographic.coord=powderymildew$demographic.coord,
 genetic.coord=powderymildew$genetic.coord,
 demographic.measures=powderymildew$demographic.measures,
 genetic.frequencies=powderymildew$genetic.frequencies)
ranking.strains(DGobject=DGdata, bw=sqrt(2), nb.mcsimul=10^3, plots=TRUE,
	kernel.type="Power4")

## Application of the ranking method to a data set simulated under the 
## mechanistic model
DGmech=DGobj.simul.mechanistic(sqrtn=10, size1=30, size2=10, theta=c(1.5,2,3), 
	beta=c(5,5), M=7, delta=0.2)
ranking.strains(DGobject=DGmech, bw=sqrt(2), nb.mcsimul=10^3, plots=TRUE,
	kernel.type="Power4")
	
## Application of the ranking method to a data set simulated under the 
## regression model
DGreg=DGobj.simul.regression(sqrtn=10, size1=30, size2=10, theta=c(1.5,2,3), 
 alpha.function=generation.alpha.3strains, sigma=0.1)
ranking.strains(DGobject=DGreg, bw=sqrt(2), nb.mcsimul=10^3, plots=TRUE,
	kernel.type="Power4")



