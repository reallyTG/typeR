library(sms)


### Name: run_parallel_SA
### Title: run_parallel_SA
### Aliases: run_parallel_SA

### ** Examples

library(sms)
data(survey)
data(census)
in.lexicon=createLexicon()
in.lexicon=addDataAssociation(in.lexicon, c("he","he"))
in.lexicon=addDataAssociation(in.lexicon, c("females","female"))

insms= new("microsimulation",census=census, panel=survey, lexicon=in.lexicon, iterations=5)
results= run_parallel_SA(insms, inseed=1900)
print(results)



