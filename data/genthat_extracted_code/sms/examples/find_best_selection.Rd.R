library(sms)


### Name: find_best_selection
### Title: find_best_selection
### Aliases: find_best_selection

### ** Examples

library(sms)
data(survey) #load the data
data(census)
in.lexicon=createLexicon() # Create a data lexicon for holding the associated column names.
in.lexicon=addDataAssociation(in.lexicon, c("he","he"))
in.lexicon=addDataAssociation(in.lexicon, c("females","female"))

this_area=as.data.frame(census[1,]) #Select the first area from the census table
insms= new("microsimulation",census=census,panel=survey, lexicon=in.lexicon, iterations=10)
best=find_best_selection(this_area, insms)
print(best)



