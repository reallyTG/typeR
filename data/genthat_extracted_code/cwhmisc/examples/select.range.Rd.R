library(cwhmisc)


### Name: select.range
### Title: Select values from a vector depending on a range in a second
###   vector.
### Aliases: select.range
### Keywords: array

### ** Examples

testvec <- c(2.1,4.3,3.2,5.1,4.2,5.7,7.1,6.5,4.1,5,6,8,7,9 ,8 ,NA,NA)
agevec  <- c(10 ,13 ,14 ,25 ,29 ,32 , 34, 45, 48, 55, 62,67,69,70,74)
select.range(testvec,agevec,25,34.5) #  5.1 4.2 5.7 7.1


