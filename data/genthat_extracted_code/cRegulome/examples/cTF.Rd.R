library(cRegulome)


### Name: cTF
### Title: Construct cTF object
### Aliases: cTF

### ** Examples

# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

# enter a custom query with different arguments
dat <- get_tf(conn,
              tf = 'LEF1',
              study = 'STES',
              min_abs_cor = .3,
              max_num = 5)

# make a cTF object   
ctf <- cTF(dat)




