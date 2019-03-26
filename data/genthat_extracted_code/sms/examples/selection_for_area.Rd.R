library(sms)


### Name: selection_for_area
### Title: selection_for_area
### Aliases: selection_for_area

### ** Examples

library(sms)
data(survey) #load the data
data(census)
in.lexicon=createLexicon() # Create a data lexicon for holding the associated column names.
in.lexicon=addDataAssociation(in.lexicon, c("he","he"))
in.lexicon=addDataAssociation(in.lexicon, c("females","female"))

# Select the first area from the census table
this_area=as.data.frame(census[1,]) 

#make a representation for this area.
sel=selection_for_area(survey, this_area, in.lexicon) 

print(sel) #print the representation



