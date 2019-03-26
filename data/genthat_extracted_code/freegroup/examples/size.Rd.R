library(freegroup)


### Name: size
### Title: Bignesses of a free object
### Aliases: size total number bigness

### ** Examples



a <- rfree(20,6,4)
size(a)
total(a)
number(a)



a <- rfree(20,6,4)
b <- rfree(20,6,4)

## Following should all be TRUE
size(a+b)   <= size(a)  + size(b)
total(a+b)  <= total(a) + total(b)
number(a+b) <= number(a)+ number(b)

bigness(rfree(10,3,3))
bigness(allconj(rfree(1,6,1)))




