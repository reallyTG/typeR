library(cRegulome)


### Name: cor_igraph
### Title: Make an igraph object
### Aliases: cor_igraph

### ** Examples

# load required libraries
library(RSQLite)
library(cRegulome)

# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- dbConnect(SQLite(), fl)

# enter a custom query with different arguments
dat <- get_mir(conn,
               mir = c('hsa-let-7g', 'hsa-let-7i'),
               study = 'STES')

# make a cmicroRNA object   
cmir <- cmicroRNA(dat)

# print object
cor_igraph(cmir)




