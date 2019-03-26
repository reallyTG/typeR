library(textstem)


### Name: lemmatize_strings
### Title: Lemmatize a Vector of Strings
### Aliases: lemmatize_strings

### ** Examples

x <- c(
    'the dirtier dog has eaten the pies',
    'that shameful pooch is tricky and sneaky',
    "He opened and then reopened the food bag",
    'There are skies of blue and red roses too!',
    NA,
    "The doggies, well they aren't joyfully running.",
    "The daddies are coming over...",
    "This is 34.546 above"
)

## Default lexicon::hash_lemmas dictionary
lemmatize_strings(x)

## Hunspell dictionary
lemma_dictionary <- make_lemma_dictionary(x, engine = 'hunspell')
lemmatize_strings(x, dictionary = lemma_dictionary)

## Bigger data set
library(dplyr)
presidential_debates_2012$dialogue %>%
    lemmatize_strings() %>%
    head()

## Not run: 
##D ## Treetagger dictionary
##D lemma_dictionary2 <- make_lemma_dictionary(x, engine = 'treetagger')
##D lemmatize_strings(x, lemma_dictionary2)
##D 
##D lemma_dictionary3 <- presidential_debates_2012$dialogue %>%
##D     make_lemma_dictionary(engine = 'treetagger')
##D 
##D presidential_debates_2012$dialogue %>%
##D      lemmatize_strings(lemma_dictionary3) %>%
##D      head()
## End(Not run)



