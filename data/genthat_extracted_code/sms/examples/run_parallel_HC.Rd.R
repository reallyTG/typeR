library(sms)


### Name: run_parallel_HC
### Title: run_parallel_HC
### Aliases: run_parallel_HC

### ** Examples

library(sms)
data(survey) #load the data
data(census)
in.lexicon=createLexicon() # Create a data lexicon for holding the associated column names.
in.lexicon=addDataAssociation(in.lexicon, c("he","he"))
in.lexicon=addDataAssociation(in.lexicon, c("females","female"))

insms= new("microsimulation",census=census,panel=survey, lexicon=in.lexicon, iterations=10)
re=run_parallel_HC(insms, inseed=1900)
print(re)




