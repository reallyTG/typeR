library(magic)


### Name: transf
### Title: Frenicle's equivalent magic squares
### Aliases: transf
### Keywords: array

### ** Examples

a <- magic(3)
identical(transf(a,0),a)

transf(a,1)
transf(a,2)

transf(a,1) %eq% transf(a,7)




