library(emil)


### Name: pre_impute_df
### Title: Impute a data frame
### Aliases: pre_impute_df

### ** Examples

x <- iris
x[sample(150, 3), 1] <- NA                                                                          
x[sample(150, 1), 3] <- NA
x[sample(150, 5), 5] <- NA
y <- gl(2, 75)
fold <- resample("holdout", y, nfold=1)[[1]]
data <- pre_split(x, y, fold) %>%
    pre_impute_df



