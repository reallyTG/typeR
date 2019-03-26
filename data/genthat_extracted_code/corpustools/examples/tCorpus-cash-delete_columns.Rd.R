library(corpustools)


### Name: tCorpus$delete_columns
### Title: Delete column from the data and meta data
### Aliases: tCorpus$delete_columns tCorpus$delete_meta_columns
###   delete_columns delete_meta_columns

### ** Examples

d = data.frame(text = c('Text one','Text two','Text three'),
               date = c('2010-01-01','2010-01-01','2012-01-01'))
tc = create_tcorpus(d)

tc$get()
tc$delete_columns('token')
tc$get()

tc$get_meta()
tc$delete_meta_columns('date')
tc$get_meta()



