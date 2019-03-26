library(cRegulome)


### Name: cmicroRNA
### Title: Construct cmicroRNA object
### Aliases: cmicroRNA

### ** Examples

# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

# enter a custom query with different arguments
dat <- get_mir(conn,
               mir = 'hsa-let-7g',
               study = 'STES',
               min_abs_cor = .3,
               max_num = 5)

# make a cmicroRNA object   
cmir <- cmicroRNA(dat)




