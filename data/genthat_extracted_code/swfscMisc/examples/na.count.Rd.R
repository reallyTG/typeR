library(swfscMisc)


### Name: na.count
### Title: Count NAs
### Aliases: na.count

### ** Examples

x <- sample(c(1:10, NA), 30, replace = TRUE)
na.count(x)
x.df <- do.call(data.frame, lapply(1:4, function(i) sample(c(1:10, NA), 30, replace = TRUE)))
colnames(x.df) <- paste("X", 1:4, sep = "")
na.count(x.df)




