library(sentimentr)


### Name: uncombine
### Title: Ungroup a 'sentiment_by' Object to the Sentence Level
### Aliases: uncombine

### ** Examples

mytext <- c(
   'do you like it?  But I hate really bad dogs',
   'I am the best friend.',
   "Do you really like it?  I'm not happy"
)

mytext <- get_sentences(mytext)
(x <- sentiment_by(mytext))
uncombine(x)

(y <- with(
    presidential_debates_2012, 
    sentiment_by(
        text.var = get_sentences(dialogue), 
        by = list(person, time)
    )
))
uncombine(y)



