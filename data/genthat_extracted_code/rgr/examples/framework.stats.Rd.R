library(rgr)


### Name: framework.stats
### Title: Compile Framework/Subset Summary Statistics
### Aliases: framework.stats
### Keywords: univar

### ** Examples

## Make test data available
data(kola.c)
attach(kola.c)

## Computes summary statistics for the Cu data
fs <- framework.stats(Cu)
fs

## Computes summary statistics for Finnish subset of the Cu data
fs <- framework.stats(Cu[COUNTRY == "FIN"])
fs

## Clean-up and detach test data
rm(fs)
detach(kola.c)



