library(gower)


### Name: gower_topn
### Title: Find the top-n matches
### Aliases: gower_topn

### ** Examples

# find the top 4 best matches in the iris data set with itself.
x <- iris[1:3,]
lookup <- iris[1:10,]
gower_topn(x=x,y=lookup,n=4)





