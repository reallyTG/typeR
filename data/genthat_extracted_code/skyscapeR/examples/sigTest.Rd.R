library(skyscapeR)


### Name: sigTest
### Title: Perform a null hypothesis significance test of a given curvigram
### Aliases: sigTest

### ** Examples

## Not run: 
##D data(RugglesRSC)
##D curv <- curvigram(RugglesRSC$Dec, sd=2)
##D sig <- sigTest(curv, null.hyp=nh.Uniform(c(57,2)))
##D 
##D plotCurv(curv, signif=sig)
## End(Not run)



