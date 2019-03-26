library(rcosmo)


### Name: ordering.CMBDataFrame
### Title: HEALPix ordering scheme from a CMBDataFrame
### Aliases: ordering.CMBDataFrame

### ** Examples

df <- CMBDataFrame(nside = 1, ordering = "nested")
ordering(df)
df1 <- ordering(df, new.ordering = "ring")
ordering(df1)




