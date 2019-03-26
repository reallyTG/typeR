library(corpustools)


### Name: tCorpus$compare_documents
### Title: Calculate the similarity of documents
### Aliases: tCorpus$compare_documents compare_documents

### ** Examples

d = data.frame(text = c('a b c d e',
                        'e f g h i j k',
                        'a b c'),
               date = c('2010-01-01','2010-01-01','2012-01-01'))
tc = create_tcorpus(d)

g = tc$compare_documents()
igraph::get.data.frame(g)

g = tc$compare_documents(measure = 'overlap_pct')
igraph::get.data.frame(g)

g = tc$compare_documents(date_col = 'date', hour_window = c(0,36))
igraph::get.data.frame(g)



