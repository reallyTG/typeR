library(FlowScreen)


### Name: FDC
### Title: Flow Duration Curve
### Aliases: FDC

### ** Examples

data(caniapiscau)
caniapiscau <- subset(caniapiscau, !is.na(caniapiscau$Flow))
FDC(caniapiscau$Flow, title="Caniapiscau River")



