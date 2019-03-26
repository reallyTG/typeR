library(ndl)


### Name: ndlStatistics
### Title: Calculate goodness of fit statistics for a naive discriminative
###   learning model.
### Aliases: ndlStatistics
### Keywords: discriminative learning

### ** Examples

data(think)
set.seed(314)
think <- think[sample(1:nrow(think),500),]
think.ndl <- ndlClassify(Lexeme ~ Agent + Patient, data=think)
ndlStatistics(think.ndl)

## Not run: 
##D data(dative)
##D dative.ndl <- ndlClassify(RealizationOfRecipient ~ AnimacyOfRec + DefinOfRec +
##D    PronomOfRec + AnimacyOfTheme + DefinOfTheme + PronomOfTheme, data=dative)
##D ndlStatistics(dative.ndl)
## End(Not run)



