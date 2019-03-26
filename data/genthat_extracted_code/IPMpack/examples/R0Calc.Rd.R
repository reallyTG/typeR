library(IPMpack)


### Name: R0Calc
### Title: Calculates net reproductive rate (R0) from an IPM.
### Aliases: R0Calc

### ** Examples

dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff), correction="constant")
Fmatrix <- makeIPMFmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), 
fecObj = makeFecObj(dff,Formula=fec~size), correction="constant")
R0Calc(Pmatrix, Fmatrix)



