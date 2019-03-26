library(BatchGetSymbols)


### Name: reshape.wide
### Title: Transforms a dataframe in the long format to a list of
###   dataframes in the wide format
### Aliases: reshape.wide

### ** Examples


my.f <- system.file( 'extdata/ExampleData.rds', package = 'BatchGetSymbols' )
df.tickers <- readRDS(my.f)
l.wide <- reshape.wide(df.tickers)
l.wide



