library(GenWin)


### Name: splineAnalyze
### Title: Spline-based window analysis
### Aliases: splineAnalyze

### ** Examples

data(chr6)
sub6 <- chr6[55000:63000,]
chr6Spline <- splineAnalyze(Y=sub6$Fst,map=sub6$Position,smoothness=100,
plotRaw=TRUE,plotWindows=TRUE,method=4)

## Not run: 
##D chr6Spline <- splineAnalyze(Y=chr6$Fst,map=chr6$Position,smoothness=100,
##D plotRaw=TRUE,plotWindows=TRUE,method=4)
## End(Not run)



