library(umx)


### Name: us_skinfold_data
### Title: Anthropometric data on twins
### Aliases: us_skinfold_data
### Keywords: datasets

### ** Examples

data(us_skinfold_data)
str(us_skinfold_data)
par(mfrow = c(1, 2))  # 1 rows and 3 columns
plot(ht_T1 ~ht_T2, ylim = c(130, 165), data = subset(us_skinfold_data, zyg == 1))
plot(ht_T1 ~ht_T2, ylim = c(130, 165), data = subset(us_skinfold_data, zyg == 3))
par(mfrow = c(1, 1))  # back to as it was



