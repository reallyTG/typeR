library(FRK)


### Name: nbasis
### Title: Number of basis functions
### Aliases: nbasis nbasis,Basis_obj-method nbasis,SRE-method

### ** Examples

library(sp)
data(meuse)
coordinates(meuse) = ~x+y # change into an sp object
G <- auto_basis(manifold = plane(),
                data=meuse,
                nres = 2,
                regular=1,
                type = "Gaussian")
print(nbasis(G))



