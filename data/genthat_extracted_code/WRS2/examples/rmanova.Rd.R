library(WRS2)


### Name: rmanova
### Title: A heteroscedastic one-way repeated measures ANOVA for trimmed
###   means.
### Aliases: rmanova rmmcp
### Keywords: models

### ** Examples

head(WineTasting)
rmanova(WineTasting$Taste, WineTasting$Wine, WineTasting$Taster)

## post hoc
rmmcp(WineTasting$Taste, WineTasting$Wine, WineTasting$Taster)

head(bush)
require(reshape)
bushLong <- melt(bush, id.var = "participant", variable_name = "food")
rmanova(bushLong$value, bushLong$food, bushLong$participant)

## post hoc
rmmcp(bushLong$value, bushLong$food, bushLong$participant)





