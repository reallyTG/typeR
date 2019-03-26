library(rcosmo)


### Name: rbind.CMBDataFrame
### Title: 'rbind' for CMBDataFrames
### Aliases: rbind.CMBDataFrame

### ** Examples

df <- CMBDataFrame(nside = 1, I = 1:12)

df.123 <- CMBDataFrame(df, spix = c(1,2,3))
df.123
df.234 <- CMBDataFrame(df, spix = c(2,3,4))
df.234

df.1234 <- rbind(df.123, df.234)
df.1234
class(df.1234) # A CMBDataFrame
pix(df.1234)

df.123234 <- rbind(df.123, df.234, unsafe = TRUE)
df.123234
class(df.123234) # A HPDataFrame
pix(df.123234)




