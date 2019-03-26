library(rgr)


### Name: gx.ecdf
### Title: Emprical Cumulative Distribution Function (ECDF)
### Aliases: gx.ecdf
### Keywords: hplot

### ** Examples
 
## Make test data available
data(kola.o)
attach(kola.o)

## Plot a simple ECDF
gx.ecdf(Cu)

## Plot an ECDF with more appropriate labelling and with the quartiles
## indicated
gx.ecdf(Cu , xlab = "Cu (mg/kg) in <2 mm Kola O-horizon soil", log = TRUE, 
ifqs = TRUE)   

## Detach test data
detach(kola.o) 



