library(vortexR)


### Name: df2disk
### Title: Save a data.frame as both Rdata and CSV
### Aliases: df2disk

### ** Examples

my.df <- data.frame(1, 1:10, sample(LETTERS[1:3], 10, replace = TRUE))
my.folder <- paste0(getwd(), '/test')
df2disk(df=my.df, dirpath=getwd(), fname='testname')
df2disk(df=my.df, dirpath=my.folder, fname='testname', postfix='_testpostfix')



