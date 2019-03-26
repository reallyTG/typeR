library(skyscapeR)


### Name: plotCurv
### Title: Plot a curvigram
### Aliases: plotCurv

### ** Examples

# Plot the curvigram of Recumbent Stone Circles:
data(RugglesRSC)
curv <- curvigram(RugglesRSC$Dec, unc=2)
plotCurv(curv, xlim=c(-40,0))

# Redo the plot to include lunar extreme declinations:
LEx <- sky.objects('moon', -2000, col='red', lty=2)
plotCurv(curv, objects=LEx, xlim=c(-40,0))

# Add significance testing information:
## Not run: 
##D sig <- sigTest(curv, nh.Uniform(c(57,2)))
##D plotCurv(curv, objects=LEx, signif=sig, xlim=c(-40,0))
## End(Not run)



