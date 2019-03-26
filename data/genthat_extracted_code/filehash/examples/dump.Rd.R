library(filehash)


### Name: dumpObjects
### Title: Dump objects of database
### Aliases: dumpObjects dumpImage dumpDF dumpList dumpEnv
### Keywords: database

### ** Examples

data <- data.frame(y = rnorm(100), x = rnorm(100), z = rnorm(100))
db <- dumpDF(data, dbName = "dataframe.dump")
fit <- with(db, lm(y ~ x + z))
summary(fit)

db <- dumpList(list(a = 1, b = 2, c = 3), "list.dump")
db$a



