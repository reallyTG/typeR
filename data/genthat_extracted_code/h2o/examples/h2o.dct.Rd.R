library(h2o)


### Name: h2o.dct
### Title: Compute DCT of an H2OFrame
### Aliases: h2o.dct

### ** Examples

## No test: 
  library(h2o)
  h2o.init()
  df <- h2o.createFrame(rows = 1000, cols = 8 * 16 * 24,
                        categorical_fraction = 0, integer_fraction = 0, missing_fraction = 0)
  df1 <- h2o.dct(data=df, dimensions=c(8 * 16 * 24, 1, 1))
  df2 <- h2o.dct(data=df1, dimensions=c(8 * 16 * 24, 1, 1), inverse=TRUE)
  max(abs(df1 - df2))

  df1 <- h2o.dct(data=df, dimensions=c(8 * 16, 24, 1))
  df2 <- h2o.dct(data=df1, dimensions=c(8 * 16, 24, 1), inverse=TRUE)
  max(abs(df1 - df2))

  df1 <- h2o.dct(data=df, dimensions=c(8, 16, 24))
  df2 <- h2o.dct(data=df1, dimensions=c(8, 16, 24), inverse=TRUE)
  max(abs(df1 - df2))
## End(No test)



