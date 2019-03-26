library(daff)


### Name: diff_data
### Title: Do a data diff
### Aliases: diff_data

### ** Examples

library(daff)
x <- iris
x[1,1] <- 10
diff_data(x, iris)

dd <- diff_data(x, iris)
#write_diff(dd, "diff.csv")
summary(dd)



