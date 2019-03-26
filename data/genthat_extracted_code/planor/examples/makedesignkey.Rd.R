library(planor)


### Name: makedesignkey
### Title: Turn Integer Matrices into an Object of Class designkey
### Aliases: makedesignkey

### ** Examples

  mat1 <- cbind(diag(3),1)
  colnames(mat1) <- c("A","B","C","D")
  mat2 <- cbind(diag(2),c(1,2))
  colnames(mat2) <- c("E","F","G")
  mat.dk <- makedesignkey(list(mat1,mat2), primes=c(2,3))
  print(mat.dk)
  summary(mat.dk)
  alias(mat.dk)
  mat.plan <- planor.design(mat.dk)



