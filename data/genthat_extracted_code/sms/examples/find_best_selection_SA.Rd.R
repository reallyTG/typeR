library(sms)


### Name: find_best_selection_SA
### Title: find_best_selection_SA
### Aliases: find_best_selection_SA

### ** Examples

library(sms)
data(survey)
data(census)
in.lexicon=createLexicon()
in.lexicon=addDataAssociation(in.lexicon, c("he","he"))
in.lexicon=addDataAssociation(in.lexicon, c("females","female"))

this_area=as.data.frame(census[1,]) #Select the first area from the census table
insms= new("microsimulation",census=census, panel=survey, lexicon=in.lexicon, iterations=5)
myselection= find_best_selection_SA( this_area, insms, inseed=1900)
print(myselection)



