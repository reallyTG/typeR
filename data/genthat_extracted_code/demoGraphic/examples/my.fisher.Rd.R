library(demoGraphic)


### Name: my.fisher
### Title: fisher exact test to get p value if any cell in propotion table
###   of expect value less than 5
### Aliases: my.fisher

### ** Examples

set.seed(2018)
data_check <-data.frame(
  group <-round(abs(rnorm(500)*10),0) %% 2,
  cat_multi_1 <-round(abs(rnorm(500)*10),0) %% 3)
my.fisher(table(data_check$cat_multi_1, data_check$group))



