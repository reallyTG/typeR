library(seriation)


### Name: permute
### Title: Permute the Order in Various Objects
### Aliases: permute permute.dist permute.numeric permute.list
###   permute.matrix permute.array permute.data.frame permute.hclust
###   permute.dendrogram
### Keywords: manip

### ** Examples

## permute matrix
m <- matrix(rnorm(10), 5, 2, dimnames = list(1:5, 1:2))
m

## permute rows and columns
permute(m, ser_permutation(5:1, 2:1))
## permute only columns
permute(m, ser_permutation(NA, 2:1))
  
## permute objects in a dist object
d <- dist(m)
d

permute(d, ser_permutation(c(3,2,1,4,5)))

## permute a list
l <- list(a=1:5, b=letters[1:3], c=0)
l
  
permute(l, c(2,3,1))    

## permute a dendrogram
hc <- hclust(d)
plot(hc)
plot(permute(hc, 5:1))



