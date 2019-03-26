library(Rpdb)


### Name: atoms
### Title: Create 'atoms' Object
### Aliases: atoms atoms.default is.atoms
### Keywords: classes

### ** Examples

x <- atoms(recname = c("ATOM","ATOM"), eleid = 1:2, elename = c("H","H"), alt = "",
resname = c("H2","H2"), chainid = "", resid = c(1,1), insert = "",
x1 = c(0,0), x2 = c(0,0), x3 = c(0,1), occ = c(0.0,0.0), temp = c(1.0,1.0),
segid = c("H2","H2"))
print(x)
is.atoms(x)




