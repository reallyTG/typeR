library(genotypeR)


### Name: grep_df_subset
### Title: Internal function to remove search and remove columns based on
###   names
### Aliases: grep_df_subset
### Keywords: columns matching remove

### ** Examples


df <- data.frame(one=rep(1,5), two=rep(1,5), three=rep(1,5), four=rep(1,5))
toMatch <- paste(c("one", "two"), collapse="|")
##remove toMatch
grep_df_subset(df, toMatch)




