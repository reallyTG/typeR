library(rgr)


### Name: gx.summary.groups
### Title: Displays Summary Statistics for a Variable Grouped by a Factor
### Aliases: gx.summary.groups
### Keywords: univar

### ** Examples

data(kola.c)
attach(kola.c)

## Generates an initial display
gx.summary.groups(COUNTRY, Cu)

## Provide a more informative display
gx.summary.groups(COUNTRY, Cu, xname = "Cu (mg/kg) in <2 mm O-horizon soil")

## As above but with a log10 transformation to display
## the geometric mean, etc.
gx.summary.groups(COUNTRY, Cu, xname = "Cu (mg/kg) in <2 mm O-horizon soil",
	log = TRUE)

## Detach test data
detach(kola.c)



