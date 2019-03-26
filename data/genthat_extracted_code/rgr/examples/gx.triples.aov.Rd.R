library(rgr)


### Name: gx.triples.aov
### Title: Carries out a 3-Level Staggered ANOVA and Estimates Variance
###   Components
### Aliases: gx.triples.aov
### Keywords: univar htest

### ** Examples

## Make test data available
data(triples.test1)
attach(triples.test1)

## Carry out unbalanced ANOVA
gx.triples.aov(Ba_ppm, xname = 
"Ba (mg/kg - Aqua Regia digestion) in <2 mm unmilled C-horizon soil")

## Detach test data
detach(triples.test1)



