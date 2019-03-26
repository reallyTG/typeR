library(textstem)


### Name: make_lemma_dictionary
### Title: Generate a Lemma Dictionary
### Aliases: make_lemma_dictionary

### ** Examples

x <- c('the dirtier dog has eaten the pies',
    'that shameful pooch is tricky and sneaky',
    "He opened and then reopened the food bag",
    'There are skies of blue and red roses too!'
)
make_lemma_dictionary(x)
## Not run: 
##D make_lemma_dictionary(x, engine = 'treetagger')
## End(Not run)



