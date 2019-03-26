library(FRK)


### Name: remove_basis
### Title: Removes basis functions
### Aliases: remove_basis remove_basis,Basis-method

### ** Examples

library(sp)
df <- data.frame(x = rnorm(10),
                 y = rnorm(10))
coordinates(df) <- ~x+y
G <- auto_basis(plane(),df,nres=1)
data.frame(G) # Print info on basis
G <- remove_basis(G,1:(nbasis(G)-1))
data.frame(G)



