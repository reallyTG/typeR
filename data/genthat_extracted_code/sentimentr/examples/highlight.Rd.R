library(sentimentr)


### Name: highlight
### Title: Polarity Text Highlighting
### Aliases: highlight

### ** Examples

library(data.table)
dat <- presidential_debates_2012
setDT(dat)

dat[, gr:={gr= paste(person, time); cumsum(c(TRUE, gr[-1]!= gr[-.N]))}]
dat <- dat[, list(person=person[1L], time=time[1L], dialogue=paste(dialogue,
    collapse = ' ')), by = gr][,gr:= NULL][, 
    dialogue_split := get_sentences(dialogue)][]

(sent_dat <- with(dat, sentiment_by(dialogue_split, list(person, time))))

## Not run: 
##D highlight(sent_dat)
##D 
##D ## tidy approach
##D library(dplyr)
##D library(magrittr)
##D 
##D hu_liu_cannon_reviews %>%
##D     filter(review_id %in% sample(unique(review_id), 3)) %>%
##D     mutate(review = get_sentences(text)) %$%
##D     sentiment_by(review, review_id) %>%
##D     highlight()
## End(Not run)



