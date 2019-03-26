library(WRS2)


### Name: rmanovab
### Title: A heteroscedastic one-way repeated measures bootstrap ANOVA for
###   trimmed means.
### Aliases: rmanovab pairdepb
### Keywords: models

### ** Examples

set.seed(123)
rmanovab(WineTasting$Taste, WineTasting$Wine, WineTasting$Taster, nboot = 300)

## post hoc
set.seed(123)
pairdepb(WineTasting$Taste, WineTasting$Wine, WineTasting$Taster, nboot = 300)




