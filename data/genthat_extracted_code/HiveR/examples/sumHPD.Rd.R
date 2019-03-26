library(HiveR)


### Name: sumHPD
### Title: Summarize a Hive Plot Data Object and Optionally Run Some Checks
### Aliases: sumHPD
### Keywords: utilities

### ** Examples


set.seed(55)
test <- ranHiveData(nx = 4, ne = 5, desc = "Tiny 4D data set")
out <- sumHPD(test, chk.all = TRUE, plot.list = TRUE)
print(out)




