library(memisc)


### Name: reorder.array
### Title: Reorder an Array or Matrix
### Aliases: reorder reorder.array reorder.matrix
### Keywords: manip

### ** Examples

  (M <- matrix(rnorm(n=25),5,5,dimnames=list(LETTERS[1:5],letters[1:5])))
  reorder(M,dim=1,names=c("E","A"))
  reorder(M,dim=2,indices=3:1)
  reorder(M,dim=1)
  reorder(M,dim=2)



