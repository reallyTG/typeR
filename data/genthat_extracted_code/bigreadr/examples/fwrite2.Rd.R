library(bigreadr)


### Name: fwrite2
### Title: Write a data frame to a text file
### Aliases: fwrite2

### ** Examples

tmp <- fwrite2(iris)
iris2 <- fread2(tmp)
all.equal(iris2, iris)  ## fread doesn't use factors



