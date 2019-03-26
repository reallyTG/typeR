library(rcosmo)


### Name: is.CMBDataFrame
### Title: Check if an object is of class CMBDataFrame
### Aliases: is.CMBDataFrame

### ** Examples


df <- CMBDataFrame(nside = 16)
is.CMBDataFrame(df)
df2 <- coords(df, new.coords = "cartesian")
is.CMBDataFrame(df2)





