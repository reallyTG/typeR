library(sentimentr)


### Name: sentiment_by
### Title: Polarity Score (Sentiment Analysis) By Groups
### Aliases: sentiment_by
### Keywords: group polarity, sentiment,

### ** Examples

mytext <- c(
   'do you like it?  It is red. But I hate really bad dogs',
   'I am the best friend.',
   "Do you really like it?  I'm not happy"
)

## works on a character vector but not the preferred method avoiding the 
## repeated cost of doing sentence boundary disambiguation every time 
## `sentiment` is run
## Not run: 
##D sentiment(mytext)
##D sentiment_by(mytext)
## End(Not run)

## preferred method avoiding paying the cost 
mytext <- get_sentences(mytext)

sentiment_by(mytext)
sentiment_by(mytext, averaging.function = average_mean)
sentiment_by(mytext, averaging.function = average_weighted_mixed_sentiment)
get_sentences(sentiment_by(mytext))

(mysentiment <- sentiment_by(mytext, question.weight = 0))
stats::setNames(get_sentences(sentiment_by(mytext, question.weight = 0)),
    round(mysentiment[["ave_sentiment"]], 3))

pres_dat <- get_sentences(presidential_debates_2012)

## Not run: 
##D ## less optimized way
##D with(presidential_debates_2012, sentiment_by(dialogue, person))
## End(Not run)

## Not run: 
##D sentiment_by(pres_dat, 'person')
##D 
##D (out <- sentiment_by(pres_dat, c('person', 'time')))
##D plot(out)
##D plot(uncombine(out))
##D 
##D sentiment_by(out, presidential_debates_2012$person)
##D with(presidential_debates_2012, sentiment_by(out, time))
##D 
##D highlight(with(presidential_debates_2012, sentiment_by(out, list(person, time))))
## End(Not run)

## Not run: 
##D ## tidy approach
##D library(dplyr)
##D library(magrittr)
##D 
##D hu_liu_cannon_reviews %>%
##D    mutate(review_split = get_sentences(text)) %$%
##D    sentiment_by(review_split)
## End(Not run)



