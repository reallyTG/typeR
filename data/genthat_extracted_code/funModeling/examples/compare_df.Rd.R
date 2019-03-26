library(funModeling)


### Name: compare_df
### Title: Compare two data frames by keys
### Aliases: compare_df

### ** Examples

data(heart_disease)
a=heart_disease
b=heart_disease
a=subset(a, age >45)
b=subset(b, age <50)
b$gender='male'
b$chest_pain=ifelse(b$chest_pain ==3, 4, b$chest_pain)
res=compare_df(a, b, c('age', 'gender'))
# Print the keys that didn't match
res
# Accessing the keys not present in the first data frame
res[[1]]$rows_not_in_X
# Accessing the keys not present in the second data frame
res[[1]]$rows_not_in_Y
# Accessing the keys which coincide completely
res[[1]]$coincident
# Accessing the rows whose values did not coincide
res[[1]]$different_values



