library(sentimentr)


### Name: extract_profanity_terms
### Title: Extract Profanity Words
### Aliases: extract_profanity_terms

### ** Examples

## Not run: 
##D bw <- sample(lexicon::profanity_alvarez, 4)
##D mytext <- c(
##D    sprintf('do you like this %s?  It is %s. But I hate really bad dogs', bw[1], bw[2]),
##D    'I am the best friend.',
##D    NA,
##D    sprintf('I %s hate this %s', bw[3], bw[4]),
##D    "Do you really like it?  I'm not happy"
##D )
##D 
##D 
##D x <- get_sentences(mytext)
##D profanity(x)
##D 
##D prof_words <- extract_profanity_terms(x)
##D prof_words
##D prof_words$sentence
##D prof_words$neutral
##D prof_words$profanity
##D data.table::as.data.table(prof_words)
##D 
##D attributes(extract_profanity_terms(x))$counts
##D attributes(extract_profanity_terms(x))$elements
##D 
##D 
##D brady <- get_sentences(crowdflower_deflategate)
##D brady_swears <- extract_profanity_terms(brady)
##D 
##D attributes(extract_profanity_terms(brady))$counts
##D attributes(extract_profanity_terms(brady))$elements
## End(Not run)



