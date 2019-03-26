library(dynpred)


### Name: toleranceplot
### Title: Create a tolerance plot
### Aliases: toleranceplot
### Keywords: univar

### ** Examples

data(ova)
toleranceplot(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova)



