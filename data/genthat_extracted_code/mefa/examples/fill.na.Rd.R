library(mefa)


### Name: fill.na
### Title: Replace <NA> Values with Nearest Above Values
### Aliases: fill.na
### Keywords: manip

### ** Examples

x <- data.frame(
    samp = c("s1",NA,"s2",NA,"s3","s4"),
    taxa = c("t1",NA,"s1","s2","s3",NA),
    count = c(1, 2, 10, 3, 4, 1),
    segm = c("male","female","male","female","male","male"))
x
fill.na(x)
fill.na(c(1:4, NA))



