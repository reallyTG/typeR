library(rgr)


### Name: framework.summary
### Title: Generate and Save Framework/Subset Summary Statistics
### Aliases: framework.summary
### Keywords: univar

### ** Examples

## Make test data available
data(kola.c)
attach(kola.c)

## Saves the file kola_c_COUNTRY_Cu_summary.csv for later use
## in the R Working Directory.
framework.summary(COUNTRY, Cu)

## Detach test data
detach(kola.c)  



