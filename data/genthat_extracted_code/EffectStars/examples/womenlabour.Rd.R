library(EffectStars)


### Name: womenlabour
### Title: Canadian Women's Labour-Force Participation
### Aliases: womenlabour
### Keywords: datasets multinomial response

### ** Examples

## Not run: 
##D data(womenlabour)
##D womenlabour$IncomeHusband <- scale(womenlabour$IncomeHusband)
##D 
##D star.nominal(Participation ~ IncomeHusband + Children + Region, womenlabour)
## End(Not run)



