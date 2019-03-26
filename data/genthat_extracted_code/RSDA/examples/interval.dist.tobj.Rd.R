library(RSDA)


### Name: interval.dist.tobj
### Title: Symbolic Objects Distance
### Aliases: interval.dist.tobj
### Keywords: Distance Symbolic

### ** Examples

data(VeterinaryData)
VD <- VeterinaryData
interval.dist.tobj(sym.obj(VD,1),sym.obj(VD,2))
interval.dist.tobj(sym.obj(VD,1),sym.obj(VD,2),distance='centers')



