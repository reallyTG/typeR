library(corpustools)


### Name: tCorpus$read_text
### Title: Print tokens as text
### Aliases: tCorpus$read_text read_text

### ** Examples

d = data.frame(text = c('First text', 'Second text', 'Third text'),
medium = c('A','A','B'),
date = c('2010-01-01','2010-02-01','2010-03-01'))
tc = create_tcorpus(d)

tc$read_text(1)
tc$read_text(2)
tc$read_text(1:3)



