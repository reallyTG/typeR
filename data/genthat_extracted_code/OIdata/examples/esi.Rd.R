library(OIdata)


### Name: esi
### Title: Environmental Sustainability Index 2005
### Aliases: esi
### Keywords: environment sustainability country energy efficiency datasets

### ** Examples

data(esi)

pch <- ifelse(esi$code == "USA", 19, 1)
plot(esi$cap_st, esi$glo_col, pch=pch)
plot(esi$vulner, esi$cap, pch=pch)



