library(RClone)


### Name: convert_GC
### Title: File conversion into RClone files
### Aliases: convert_GC
### Keywords: documentation

### ** Examples

test <- matrix("232/231", ncol = 2, nrow = 2)
convert_GC(test, 3, "/") 
#"232" is a allele of length 3 and "/" is the separator.

test2 <- matrix("192235", ncol = 2, nrow = 2)
convert_GC(test2, 3) 
#no separator

#with data1, a genind object from adegenet:
#test <- genind2df(data1)
#convert_GC(test, 3, "/")



