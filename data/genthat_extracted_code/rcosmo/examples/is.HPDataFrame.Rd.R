library(rcosmo)


### Name: is.HPDataFrame
### Title: Check if an object is of class 'HPDataFrame'
### Aliases: is.HPDataFrame

### ** Examples


df <- CMBDataFrame(nside = 16)
is.HPDataFrame(df)

df <- HPDataFrame(I = rep(0,12), nside = 1)
is.HPDataFrame(df)




