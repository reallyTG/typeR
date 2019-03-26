library(rgr)


### Name: gx.triples.fgx
### Title: ANOVA to Estimate if 'Triples' are a Valid Subset
### Aliases: gx.triples.fgx
### Keywords: univar htest

### ** Examples

## Make test data available
data(triples.test2)
attach(triples.test2)

## Carry out ANOVAs for equivalence of variances
gx.triples.fgx(Ba_ppm, RS, xname = 
"Ba (mg/kg - Aqua Regia digestion) in <2 mm unmilled C-horizon soil")

## Detach test data
detach(triples.test2)



