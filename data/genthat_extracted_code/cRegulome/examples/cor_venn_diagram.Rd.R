library(cRegulome)


### Name: cor_venn_diagram
### Title: Venn Diagram of microRNA or transcription factor correlated
###   features
### Aliases: cor_venn_diagram

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

# make graph
cor_venn_diagram(cmir)




