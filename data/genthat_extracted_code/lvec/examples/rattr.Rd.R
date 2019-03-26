library(lvec)


### Name: rattr
### Title: Set and get attributes of the original R-vector stored in an
###   lvec
### Aliases: rattr rattr<-

### ** Examples

dates <- as_lvec(as.Date("2016-12-05", "2016-12-24"))
# When printing and reading the result is converted back to a date object
print(dates)
as_rvec(dates)

# make a factor of an integer lvec 
a <- as_lvec(1:3)
rattr(a, "class") <- "factor"
rattr(a, "levels") <- c("a", "b", "c")
print(a)




