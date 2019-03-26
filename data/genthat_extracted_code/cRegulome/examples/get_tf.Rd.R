library(cRegulome)


### Name: get_tf
### Title: Get transcription factor correlations from cRegulome.db
### Aliases: get_tf

### ** Examples

# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

## Not run: 
##D # get transcription factors correlations in all studies
##D get_tf(conn,
##D         tf = 'LEF1')
## End(Not run)

# get correlations in a particular study
get_tf(conn,
       tf = 'LEF1',
       study = 'STES')

# enter a custom query with different arguments
get_tf(conn,
       tf = 'LEF1',
       study = 'STES',
       min_abs_cor = .3,
       max_num = 5)




