library(dmm)


### Name: warcolak.convert
### Title: Convert 'warcolak' data file to format required for a dataframe
###   for 'dmm()' or 'mdf()'.
### Aliases: warcolak.convert
### Keywords: manip

### ** Examples


library(dmm)
data(warcolak)
warcolak.df <- warcolak.convert(warcolak)
str(warcolak.df)
rm(warcolak.df)
rm(warcolak)




