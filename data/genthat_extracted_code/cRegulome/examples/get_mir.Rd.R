library(cRegulome)


### Name: get_mir
### Title: Get microRNA correlations from cRegulome.db
### Aliases: get_mir

### ** Examples

# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

# get microRNA correlations in all studies
get_mir(conn,
        mir = 'hsa-let-7g')

# get correlations in a particular study
get_mir(conn,
        mir = 'hsa-let-7g',
        study = 'STES')

# enter a custom query with different arguments
get_mir(conn,
        mir = 'hsa-let-7g',
        study = 'STES',
        min_abs_cor = .3,
        max_num = 5)




