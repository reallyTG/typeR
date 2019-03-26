library(BioGeoBEARS)


### Name: dfnums_to_numeric
### Title: Get the class for each column in a list
### Aliases: dfnums_to_numeric

### ** Examples

x = matrix(c(1,2,3,4,5,6), nrow=3, ncol=2)
cls.df(x)
dfnums_to_numeric(adf(x))
unlist_df4(x)

x = matrix(c(1,2,3,4,5,"A"), nrow=3, ncol=2)
cls.df(x)
dfnums_to_numeric(adf(x))
unlist_df4(x)

x = adf(matrix(c(1,2,3,4,5,"A"), nrow=3, ncol=2))
names(x) = c("A","B")
cls.df(x)
dfnums_to_numeric(adf(x))
unlist_df4(x)



