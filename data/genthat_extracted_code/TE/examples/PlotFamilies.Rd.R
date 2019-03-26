library(TE)


### Name: PlotFamilies
### Title: Plot the age distributions or insertion rates for multiple
###   families.
### Aliases: PlotFamilies

### ** Examples

data(AetLTR)
copia3 <- subset(AetLTR, GroupID == 3 & !is.na(Chr))
gypsy24 <- subset(AetLTR, GroupID == 24 & !is.na(Chr))
res3 <- EstDynamics(copia3$Mismatch, copia3$UngapedLen)
res24 <- EstDynamics2(gypsy24$Mismatch, gypsy24$UngapedLen)

# Plot insertion rates
PlotFamilies(list(`Copia 3`=res3, `Gypsy 24`=res24))

# Plot age distributions
PlotFamilies(list(`Copia 3`=res3, `Gypsy 24`=res24), type='ageDist')



