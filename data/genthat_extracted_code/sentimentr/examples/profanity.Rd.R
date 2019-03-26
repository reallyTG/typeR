library(sentimentr)


### Name: profanity
### Title: Compute Profanity Rate
### Aliases: profanity
### Keywords: bad-words cursing, cussing, profanity, vulgarity,

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
##D ## works on a character vector but not the preferred method avoiding the 
##D ## repeated cost of doing sentence boundary disambiguation every time 
##D ## `profanity` is run
##D profanity(mytext)
##D 
##D ## preferred method avoiding paying the cost 
##D mytext2 <- get_sentences(mytext)
##D profanity(mytext2)
##D 
##D plot(profanity(mytext2))
##D 
##D brady <- get_sentences(crowdflower_deflategate)
##D brady_swears <- profanity(brady)
##D brady_swears
##D hist(brady_swears$profanity)
##D sum(brady_swears$profanity > 0)
##D hist(brady_swears$profanity[brady_swears$profanity > 0])
## End(Not run)



