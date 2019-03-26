library(sjmisc)


### Name: row_sums
### Title: Row sums and means for data frames
### Aliases: row_sums row_sums.default row_sums.mids row_means total_mean
###   row_means.default row_means.mids

### ** Examples

data(efc)
efc %>% row_sums(c82cop1:c90cop9, n = 3, append = FALSE)

library(dplyr)
row_sums(efc, contains("cop"), n = 2, append = FALSE)

dat <- data.frame(
  c1 = c(1,2,NA,4),
  c2 = c(NA,2,NA,5),
  c3 = c(NA,4,NA,NA),
  c4 = c(2,3,7,8),
  c5 = c(1,7,5,3)
)
dat

row_means(dat, n = 4)
row_sums(dat, n = 4)

row_means(dat, c1:c4, n = 4)
# at least 40% non-missing
row_means(dat, c1:c4, n = .4)
row_sums(dat, c1:c4, n = .4)

# total mean of all values in the data frame
total_mean(dat)

# create sum-score of COPE-Index, and append to data
efc %>%
  select(c82cop1:c90cop9) %>%
  row_sums(n = 1)

# if data frame has only one column, this column is returned
row_sums(dat[, 1, drop = FALSE], n = 0)




