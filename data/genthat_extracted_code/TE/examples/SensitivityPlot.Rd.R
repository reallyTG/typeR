library(TE)


### Name: SensitivityPlot
### Title: Generate sensitivity plots
### Aliases: SensitivityPlot

### ** Examples

data(AetLTR)
copia3 <- subset(AetLTR, GroupID == 3 & !is.na(Chr))
copia9 <- subset(AetLTR, GroupID == 9 & !is.na(Chr))
res3 <- EstDynamics(copia3$Mismatch, copia3$UngapedLen)
res9 <- EstDynamics(copia9$Mismatch, copia9$UngapedLen)
SensitivityPlot(list(`Copia 3`=res3, `Copia 9`=res9))



