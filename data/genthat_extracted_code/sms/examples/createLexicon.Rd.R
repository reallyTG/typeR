library(sms)


### Name: createLexicon
### Title: createLexicon
### Aliases: createLexicon

### ** Examples

library(sms)
data(survey)
data(census)
in.lexicon=createLexicon()
in.lexicon=addDataAssociation(in.lexicon, c("he","he"))
in.lexicon=addDataAssociation(in.lexicon, c("females","female"))
print(in.lexicon)



