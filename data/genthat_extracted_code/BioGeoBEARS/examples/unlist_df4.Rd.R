library(BioGeoBEARS)


### Name: unlist_df4
### Title: Unlist the columns in a data.frame, with more checks, adf, and
###   dfnums_to_numeric
### Aliases: unlist_df4

### ** Examples

x = matrix(c(1,2,3,4,5,6), nrow=3, ncol=2)
cls.df(x)
unlist_df4(x)

x = matrix(c(1,2,3,4,5,"A"), nrow=3, ncol=2)
cls.df(x)
unlist_df4(x)

x = adf(matrix(c(1,2,3,4,5,"A"), nrow=3, ncol=2))
names(x) = c("A","B")
cls.df(x)
unlist_df4(x)



