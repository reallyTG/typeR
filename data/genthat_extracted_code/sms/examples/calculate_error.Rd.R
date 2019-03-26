library(sms)


### Name: calculate_error
### Title: Calculate error of a selection
### Aliases: calculate_error

### ** Examples

library(sms)
data(survey) #load the data
data(census)
in.lexicon=createLexicon() # Create a data lexicon for holding the associated column names.
in.lexicon=addDataAssociation(in.lexicon, c("he","he"))
in.lexicon=addDataAssociation(in.lexicon, c("females","female"))

#Select the first area from the census table
this_area=as.data.frame(census[1,]) 

#make a random selection of individuals for this area.
selection=random_panel_selection( survey, this_area$population ) 

#evaluate the Total Absolute Error (TAE) for this selection
error=calculate_error( selection, this_area, in.lexicon ) 
print( error )    # print the error of the selection



