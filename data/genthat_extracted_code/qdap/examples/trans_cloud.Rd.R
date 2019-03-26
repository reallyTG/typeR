library(qdap)


### Name: trans_cloud
### Title: Word Clouds by Grouping Variable
### Aliases: trans_cloud
### Keywords: wordcloud

### ** Examples

## Not run: 
##D terms <- list(
##D     I=c("i", "i'm"),
##D     mal=qcv(stinks, dumb, distrust),
##D     articles=qcv(the, a, an),
##D     pronoun=qcv(we, you)
##D )
##D 
##D with(DATA, trans_cloud(state, person, target.words=terms, 
##D     cloud.colors=qcv(red, green, blue, black, gray65), 
##D     expand.target=FALSE, proportional=TRUE, legend=c(names(terms), 
##D     "other")))
##D 
##D with(DATA, trans_cloud(state, person, target.words=terms,
##D     stopwords=exclude(with(DATA, unique(bag_o_words(state))), 
##D         unique(unlist(terms))), 
##D     cloud.colors=qcv(red, green, blue, black, gray65), 
##D     expand.target=FALSE, proportional=TRUE, legend=names(terms)))
##D     
##D     
##D #color the negated phrases opposite:
##D DATA <- qdap::DATA
##D DATA[1, 4] <- "This is not good!"
##D DATA[8, 4] <- "I don't distrust you."
##D 
##D DATA$state <- space_fill(DATA$state, paste0(negation.words, " "), 
##D     rm.extra = FALSE)
##D 
##D txt <- gsub("~~", " ", breaker(DATA$state))
##D rev.neg <- sapply(negation.words, paste, negative.words)
##D rev.pos <- sapply(negation.words, paste, positive.words)
##D 
##D 
##D tw <- list(
##D     positive=c(positive.words, rev.neg[rev.neg %in% txt]), 
##D     negative=c(negative.words, rev.pos[rev.pos %in% txt])
##D )
##D 
##D 
##D with(DATA, trans_cloud(state, person,
##D     target.words=tw,
##D     cloud.colors=qcv(darkgreen, red, gray65),
##D     expand.target=FALSE, proportional=TRUE, legend=names(tw)))
##D 
##D DATA <- qdap::DATA  ## Reset DATA
## End(Not run)



