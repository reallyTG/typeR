library(ndl)


### Name: ndlClassify
### Title: Classification using naive discriminative learning.
### Aliases: ndlClassify print.ndlClassify
### Keywords: classif

### ** Examples

data(think)
set.seed(314)
think <- think[sample(1:nrow(think),500),]
think.ndl <- ndlClassify(Lexeme ~ (Person * Number * Agent) + Register,
   data=think)
summary(think.ndl)

## Not run: 
##D think.ndl.SA <- ndlClassify(Lexeme ~ (Polarity + Voice + Mood + Person +
##D   Number + Covert + ClauseEquivalent + Agent + Patient + Manner + Time +
##D   Modality1 + Modality2 + Source + Goal + Quantity + Location +
##D   Duration + Frequency + MetaComment + ReasonPurpose + Condition +
##D   CoordinatedVerb)^2 + Author + Section, data=think)
##D summary(think.ndl.SA)
## End(Not run)

## Not run: 
##D data(dative)
##D out <- which(is.element(colnames(dative), c("Speaker","Verb")))
##D dative <- dative[-out]
##D dative.ndl <- ndlClassify(RealizationOfRecipient ~ ., data=dative)
##D summary(dative.ndl)
##D 
## End(Not run)



