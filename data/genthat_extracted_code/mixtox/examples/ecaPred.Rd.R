library(mixtox)


### Name: ecaPred
### Title: Mixture Effect Predicted by CA at Particular Concentration of a
###   Mixture
### Aliases: ecaPred
### Keywords: concentration addition mixture effect

### ** Examples

## example
# predict the CA predicted response at the concentrations that cause 5%, 10%, 20%, and 50% 
# effect of antibiotic mixtures
# each mixture contains eight components. Totally, there are 10 mixtures designed by the udcr.

sgl <- antibiotox$sgl
mix <- antibiotox$udcr.mix
pct <- antibiotox$udcr.pct
ecaPred(effv = c(0.05, 0.1, 0.20, 0.5), sgl, mix, pct)



