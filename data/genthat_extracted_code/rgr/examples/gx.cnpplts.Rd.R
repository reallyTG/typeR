library(rgr)


### Name: gx.cnpplts
### Title: Multiple (max 9) Cumulative Normal Probability (CPP) plots
### Aliases: gx.cnpplts
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.c)
attach(kola.c)

## An example
gx.cnpplts(xlab = "Cu (mg/kg) in <2 mm Kola C-horizon soil", log = TRUE, 
	xlim = NULL, main = "", iflgnd = FALSE, Cu[COUNTRY == "RUS"], 
	Cu[COUNTRY == "FIN"], Cu[COUNTRY == "NOR"])

## An example that leads to a cleaner legend
## First select data for the variable to be plotted for the subsets, from
## dimnames(kola.c) we know that Be is the 19th column in the data frame
Norway <- gx.subset(kola.c,COUNTRY=="NOR")[,19]
Russia <- gx.subset(kola.c,COUNTRY=="RUS")[,19]
Finland <- gx.subset(kola.c,COUNTRY=="FIN")[,19]
gx.cnpplts(xlab = "Be (mg/kg) in <2 mm Kola C-horizon soils", log = TRUE,
	xlim = NULL, main  ="", iflgnd = FALSE, Finland, Russia, Norway)

## An example where the limits of the x-axis are provided
gx.cnpplts(xlab = "Be (mg/kg) in <2 mm Kola C-horizon soils", log = TRUE,
	xlim = c(0.02, 20), main  ="", iflgnd = FALSE, Finland, Russia, Norway)

## An example of a multi-element display
gx.cnpplts(xlab = "Concentrations (mg/kg) in <2 mm Kola C-horizon soils",
	log = TRUE, xlim = NULL, main = "Kola Project, 1995", 
	iflgnd = FALSE ,Cu, Ni, Co)

## Clean-up and detach test data
rm(Norway)
rm(Russia)
rm(Finland)
detach(kola.c)



