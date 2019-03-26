library(sentimentr)


### Name: profanity_by
### Title: Profanity Rate By Groups
### Aliases: profanity_by
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
##D profanity_by(mytext)
##D 
##D ## preferred method avoiding paying the cost 
##D mytext <- get_sentences(mytext)
##D 
##D profanity_by(mytext)
##D get_sentences(profanity_by(mytext))
##D 
##D (myprofanity <- profanity_by(mytext))
##D stats::setNames(get_sentences(profanity_by(mytext)),
##D     round(myprofanity[["ave_profanity"]], 3))
##D 
##D brady <- get_sentences(crowdflower_deflategate)
##D library(data.table)
##D bp <- profanity_by(brady)
##D crowdflower_deflategate[bp[ave_profanity > 0,]$element_id, ]
##D 
##D vulgars <- bp[["ave_profanity"]] > 0
##D stats::setNames(get_sentences(bp)[vulgars],
##D     round(bp[["ave_profanity"]][vulgars], 3))
##D     
##D bt <- data.table(crowdflower_deflategate)[, 
##D     source := ifelse(grepl('^RT', text), 'retweet', 'OP')][,
##D     belichick := grepl('\\bb[A-Za-z]+l[A-Za-z]*ch', text, ignore.case = TRUE)][]
##D 
##D prof_bel <- with(bt, profanity_by(text, by = list(source, belichick)))
##D 
##D plot(prof_bel)
## End(Not run)



