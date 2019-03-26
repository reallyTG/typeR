library(miceadds)


### Name: index.dataframe
### Title: R Utilities: Include an Index to a Data Frame
### Aliases: index.dataframe
### Keywords: R utilities

### ** Examples

dfr <- matrix( 2*1:12-3, 4,3 )
colnames(dfr) <- paste0("X",1:ncol(dfr))
index.dataframe( dfr)
  ##     index X1 X2 X3
  ##   1     1 -1  7 15
  ##   2     2  1  9 17
  ##   3     3  3 11 19
  ##   4     4  5 13 21
index.dataframe( dfr, systime=TRUE)
  ##     index         file_created X1 X2 X3
  ##   1     1  2013-08-22 10:26:28 -1  7 15
  ##   2     2  2013-08-22 10:26:28  1  9 17
  ##   3     3  2013-08-22 10:26:28  3 11 19
  ##   4     4  2013-08-22 10:26:28  5 13 21



