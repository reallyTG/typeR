library(quanteda)


### Name: textstat_select
### Title: Select rows of textstat objects by glob, regex or fixed patterns
### Aliases: textstat_select
### Keywords: internal textstat

### ** Examples

period <- ifelse(docvars(data_corpus_inaugural, "Year") < 1945, "pre-war", "post-war")
mydfm <- dfm(data_corpus_inaugural, groups = period)
keyness <- textstat_keyness(mydfm)
textstat_select(keyness, 'america*')




