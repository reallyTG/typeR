library(Rpdb)


### Name: pdb
### Title: Create an Object of Class 'pdb'
### Aliases: is.pdb pdb pdb.default
### Keywords: classes

### ** Examples

title  <- "This is just an example"
remark <- NULL
cryst1 <- cryst1(c(10,10,10))
atoms <- atoms(recname = c("ATOM","ATOM"), eleid = 1:2, elename = c("H","H"), alt = "",
               resname = c("H2","H2"), chainid = "", resid = c(1,1), insert = "",
               x1 = c(0,0), x2 = c(0,0), x3 = c(0,1), occ = c(0.0,0.0), temp = c(1.0,1.0),
               segid = c("H2","H2"))
conect <- conect(eleid.1 = c(1), eleid.2 = c(2))
x <- pdb(atoms = atoms, cryst1 = cryst1, conect = conect, remark = remark, title = title)
is.pdb(x)




