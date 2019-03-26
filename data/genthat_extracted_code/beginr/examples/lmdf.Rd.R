library(beginr)


### Name: lmdf
### Title: calculate linear regression between every two columns in a data
###   frame. in: a dataframes. out: a dataframe showing the linear
###   regression.
### Aliases: lmdf

### ** Examples

df <- data.frame(a = 1:10, b = 1:10 + rnorm(10), c = 1:10 + rnorm(10))
lmdf(df)




