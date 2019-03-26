library(freegroup)


### Name: keep
### Title: Keep or drop symbols
### Aliases: keep discard drop drop.free

### ** Examples

x <- rfree(10,5,8)

keep(x,abc(4))           # keep only symbols a,b,c,d
discard(x,as.free('cde'))   # drop symbols c,d,e



x[1:4] %<>% keep(alpha(3))  # keep only abc in first 4 elements of x






