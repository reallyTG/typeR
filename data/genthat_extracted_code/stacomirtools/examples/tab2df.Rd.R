library(stacomirtools)


### Name: tab2df
### Title: Function to transform a ftable into dataframe but just keeping
###   the counts, works with ftable of dim 2
### Aliases: tab2df

### ** Examples

df <- data.frame("var1" = c("blue","red"), "var2" = c("nice","ugly"))
ftdf <- ftable(df)
tab2df(ftdf)



