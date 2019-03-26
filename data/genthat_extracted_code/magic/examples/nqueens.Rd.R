library(magic)


### Name: nqueens
### Title: N queens problem
### Aliases: nqueens bernhardsson bernhardssonA bernhardssonB
### Keywords: array

### ** Examples

bernhardsson(7)

a <-
  matrix(
         c(3,6,2,7,1,4,8,5,
           2,6,8,3,1,4,7,5,
           6,3,7,2,4,8,1,5,
           3,6,8,2,4,1,7,5,
           4,8,1,3,6,2,7,5,
           7,2,6,3,1,4,8,5,
           2,6,1,7,4,8,3,5,
           1,6,8,3,7,4,2,5,
           1,5,8,6,3,7,2,4,
           2,4,6,8,3,1,7,5,
           6,3,1,8,4,2,7,5,
           4,6,8,2,7,1,3,5)
         ,8,12)

out <- array(0L,c(8,8,12))
for(i in 1:12){
  out[cbind(seq_len(8),a[,i],i)] <- 1L
}





