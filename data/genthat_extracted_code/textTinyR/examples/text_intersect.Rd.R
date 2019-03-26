library(textTinyR)


### Name: text_intersect
### Title: intersection of words or letters in tokenized text
### Aliases: text_intersect
### Keywords: datasets

### ** Examples


library(textTinyR)

tok1 = list(c('compare', 'this', 'text'),

            c('and', 'this', 'text'))

tok2 = list(c('with', 'another', 'set'),

            c('of', 'text', 'documents'))


init = text_intersect$new(tok1, tok2)


init$count_intersect(distinct = TRUE, letters = FALSE)


init$ratio_intersect(distinct = FALSE, letters = TRUE)



