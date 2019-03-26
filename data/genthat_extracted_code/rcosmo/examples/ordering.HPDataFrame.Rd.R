library(rcosmo)


### Name: ordering.HPDataFrame
### Title: HEALPix ordering scheme from a HPDataFrame
### Aliases: ordering.HPDataFrame

### ** Examples


df <- HPDataFrame(I = rep(0,12), nside = 1, ordering = "nested")
ordering(df)
df1 <- ordering(df, new.ordering = "ring")
ordering(df1)




