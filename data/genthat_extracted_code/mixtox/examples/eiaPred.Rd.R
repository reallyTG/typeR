library(mixtox)


### Name: eiaPred
### Title: Mixture Effect Predicted by IA at Particular Concentration of a
###   Mixture
### Aliases: eiaPred
### Keywords: independent action mixture effect

### ** Examples

## example 1
# predict the IA predicted response (cytotoxicity) at the concentrations that cause 10% and 50% 
# effect of an mixture. 
# each mixture contains eight components. Totally, there are 10 mixtures designed by the udcr.

sgl <- cytotox$sgl
mix <- cytotox$udcr.mix
pct <- cytotox$udcr.pct
eiaPred(effv = c(0.1, 0.5), sgl, mix, pct)

## example 2
# predict the IA predicted response at the concentrations that cause 5% and 50% effect 
# of antibiotic mixtures.
# each mixture contains eight components. Totally, there are 2 mixtures designed by the eecr.

sgl <- antibiotox$sgl
mix <- antibiotox$eecr.mix
pct <- antibiotox$eecr.pct
eiaPred(effv = c(0.05, 0.5), sgl, mix, pct)

## example 2
# predict the IA predicted response at the concentrations that cause 5%, 10%, 20%, and 
# 50% effect of antibiotic mixtures.
# each mixture contains eight components. Totally, there are 10 mixtures designed by the udcr.

sgl <- antibiotox$sgl
mix <- antibiotox$udcr.mix
pct <- antibiotox$udcr.pct
eiaPred(effv = c(0.05, 0.10, 0.20, 0.5), sgl, mix, pct)



