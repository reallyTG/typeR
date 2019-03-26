library(corpustools)


### Name: tCorpus$deduplicate
### Title: Deduplicate documents
### Aliases: tCorpus$deduplicate deduplicate

### ** Examples

d = data.frame(text = c('a b c d e',
                        'e f g h i j k',
                        'a b c'),
               date = c('2010-01-01','2010-01-01','2012-01-01'))
tc = create_tcorpus(d)

tc$get_meta()
dedup = tc$deduplicate(feature='token', date_col = 'date', similarity = 0.8, copy=TRUE)
dedup$get_meta()

dedup = tc$deduplicate(feature='token', date_col = 'date', similarity = 0.8, keep = 'last',
                       copy=TRUE)
dedup$get_meta()



