library(popdemo)


### Name: eigs
### Title: Calculate asymptotic growth
### Aliases: eigs

### ** Examples

  # load the desert tortoise data
  data(Tort)
  
  # find the dominant eigenvalue
  eigs(Tort, "lambda")
  
  #find the stable stage structure
  eigs(Tort, "ss")
  
  #find the reproductive value
  eigs(Tort, "rv")
  
  #find both dominant eigenvectors
  eigs(Tort, c("ss","rv"))
  
  #find all eigenstuff
  eigs(Tort)




