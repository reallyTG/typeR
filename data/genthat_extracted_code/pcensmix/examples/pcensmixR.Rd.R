library(pcensmix)


### Name: pcensmixR
### Title: Fitting a Normal Mixture Model to a Real Progressive Type-II
###   Censored Mixture Data Using EM Algorithm
### Aliases: pcensmixR pcensmixR.pcgen

### ** Examples

## Example 1: fit a mixture model to 'insulate' data
set.seed(107)
Pdat<- pcgen(r = 15, p = 0.6, data = insulate)
pcensmixR(Pdat, start = c(5, 3, 35, 20, 0.6))

## Not run: 
##D ## Example 2: fit a mixture model to 'Systolic blood pressure' data
##D set.seed(1010)
##D pcensmixR(Pdat = pcgen(360, 0.35, blood$Systolic.BP),
##D                start = c(120, 15, 150, 20, 0.6))
## End(Not run)




