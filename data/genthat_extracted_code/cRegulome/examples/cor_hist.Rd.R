library(cRegulome)


### Name: cor_hist
### Title: A histogram of the correlations of microRNA or tf sets
### Aliases: cor_hist

### ** Examples

# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

# enter a custom query with different arguments
dat <- get_mir(conn,
               mir = c('hsa-let-7g', 'hsa-let-7i'),
               study = 'STES')

# make a cmicroRNA object   
cmir <- cmicroRNA(dat)

# print object
cor_hist(cmir)




