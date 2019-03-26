library(miscset)


### Name: sort
### Title: Sort data.frame Objects
### Aliases: sort sort.data.frame

### ** Examples

#

d <- data.frame(a=c(1,1,1,2,NA),b=c(2,1,3,1,1),c=5:1)
d
sort(d) # sort by every column (a, then b, then c)
sort(d, TRUE, by="c") # decreasing by column 'c'
sort(d, bye=.(a,c)) # increasing by columns 'a' and then 'c'

#



