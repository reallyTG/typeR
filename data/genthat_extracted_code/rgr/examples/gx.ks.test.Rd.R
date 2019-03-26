library(rgr)


### Name: gx.ks.test
### Title: Kolmogorov-Smirnov test with ECDF Plot
### Aliases: gx.ks.test
### Keywords: hplot htest nonparametric

### ** Examples

## Make test data available
data(kola.c)
attach(kola.c)

## First select data for the variable to be plotted for the subsets, from
## dimnames(kola.c) we know that Be is the 19th column in the data frame
Norway <- gx.subset(kola.c,COUNTRY=="NOR")[,19]
Russia <- gx.subset(kola.c,COUNTRY=="RUS")[,19]
Finland <- gx.subset(kola.c,COUNTRY=="FIN")[,19]

## NOTE: the examples below are commented out as gx.ks.test makes a 
## call to the locator function that fails when the examples are run
## during package checking and building
## Initial plot
## gx.ks.test(Finland, Russia, xlab = "Be (mg/kg) in <2 mm Kola C-horizon soils",
##	log = TRUE, main  = "Kola Ecogeochemistry Project, 1995")

## The same plot as above, but with the results suppressed and the
## annotation better scaled, the legend and plot symbols at 75%, the
## plot title at 90% and the axis labelling at 80%
## gx.ks.test(Finland, Russia, xlab = "Be (mg/kg) in <2 mm Kola C-horizon soils",
##	log = TRUE, main  = "Kola Ecogeochemistry Project, 1995",
##	ifresult = F, cex = 0.75, cexp = 0.75, cex.main = 0.9, cex.lab = 0.8,
##	cex.axis = 0.8)

## Clean-up and detach test data
rm(Norway)
rm(Russia)
rm(Finland)
detach(kola.c)



