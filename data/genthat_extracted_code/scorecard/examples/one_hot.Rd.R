library(scorecard)


### Name: one_hot
### Title: One Hot Encoding
### Aliases: one_hot

### ** Examples

# load germancredit data
data(germancredit)

library(data.table)
dat = rbind(
  germancredit[, c(sample(20,3),21)],
  data.table(creditability=sample(c("good","bad"),10,replace=TRUE)),
  fill=TRUE)

# one hot encoding
## keep na columns from categorical variable
dat_onehot1 = one_hot(dat, var_skip = 'creditability', nacol_rm = FALSE) # default
str(dat_onehot1)
## remove na columns from categorical variable
dat_onehot2 = one_hot(dat, var_skip = 'creditability', nacol_rm = TRUE)
str(dat_onehot2)

## one hot and replace NAs
dat_onehot3 = one_hot(dat, var_skip = 'creditability', replace_na = -1)
str(dat_onehot3)


# replace missing values only
## replace with -1
dat_repna1 = one_hot(dat, var_skip = names(dat), replace_na = -1)
## replace with median for numeric, and mode for categorical
dat_repna2 = one_hot(dat, var_skip = names(dat), replace_na = 'median')
## replace with to mean for numeric, and mode for categorical
dat_repna3 = one_hot(dat, var_skip = names(dat), replace_na = 'mean')





