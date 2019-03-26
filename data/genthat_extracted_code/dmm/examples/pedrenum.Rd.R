library(dmm)


### Name: pedrenum
### Title: Renumbers the Id, SId, and DId columns of a dataframe
### Aliases: pedrenum
### Keywords: manip

### ** Examples


library(dmm)
data(dt8bal.df)
# note these data do not need renumbering, but will use as a demo
tmprenum <- pedrenum(dt8bal.df)
# In this case all that happens is that SId, which was a factor in dt8bal.df, is
# converted back to int. The numeric codes are unaltered.
rm(dt8bal.df)
rm(tmprenum)



