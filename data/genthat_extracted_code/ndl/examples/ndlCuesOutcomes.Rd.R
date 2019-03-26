library(ndl)


### Name: ndlCuesOutcomes
### Title: Creation of dataframe for Naive Discriminative Learning from
###   formula specification
### Aliases: ndlCuesOutcomes
### Keywords: classif

### ** Examples

data(think)
set.seed(314)
think <- think[sample(1:nrow(think),500),]
think.CuesOutcomes <- ndlCuesOutcomes(Lexeme ~ (Person * Number * Agent) + Register, 
data=think)
head(think.CuesOutcomes)

## Not run: 
##D data(dative)
##D dative.cuesOutcomes <- ndlCuesOutcomes(RealizationOfRecipient ~ LengthOfRecipient +
##D    LengthOfTheme, data=dative, numeric2discrete=NULL)
##D table(dative.cuesOutcomes$Cues)
##D 
##D dative.cuesOutcomes1 <- ndlCuesOutcomes(RealizationOfRecipient ~ LengthOfRecipient +
##D    LengthOfTheme, data=dative)
##D table(dative.cuesOutcomes1$Cues)
##D 
##D dative.cuesOutcomes2 <- ndlCuesOutcomes(RealizationOfRecipient ~ LengthOfRecipient +
##D    LengthOfTheme, data=dative, g.numeric=3)
##D table(dative.cuesOutcomes2$Cues)
##D 
## End(Not run)



