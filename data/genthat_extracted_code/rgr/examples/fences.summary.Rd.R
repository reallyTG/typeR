library(rgr)


### Name: fences.summary
### Title: Generate and Save Fence Values for Data Subsets
### Aliases: fences.summary
### Keywords: univar

### ** Examples

## Make test data available
data(kola.c)
attach(kola.c)

## Saves the file kola_c_COUNTRY_Cu_fences.txt for later use
## in the R Working Directory.
fences.summary(COUNTRY, Cu)

## Detach test data 
detach(kola.c)



