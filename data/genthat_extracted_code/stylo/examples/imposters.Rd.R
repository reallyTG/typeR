library(stylo)


### Name: imposters
### Title: Authorship Verification Classifier Known as the Imposters Method
### Aliases: imposters

### ** Examples

## Not run: 
##D # performing the imposters method on the dataset provided by the package:
##D 
##D # activating the datasets with "The Cuckoo's Calling", possibly written by JK Rowling
##D data(galbraith)
##D 
##D # running the imposters method against all the remaining authorial classes
##D imposters(galbraith)
##D 
##D # general usage:
##D 
##D # Let's assume there is a table with frequencies, the 8th row of which contains
##D # the data for a text one wants to verify.
##D 
##D # getting the 8th row from the dataset
##D text_to_be_tested = dataset[8,]
##D 
##D # building the reference set so that it does not contain the 8th row
##D remaining_frequencies = dataset[-c(8),]
##D 
##D # launching the imposters method:
##D imposters(reference.set = remaining_frequencies, test = text_to_be_tested)
## End(Not run)



