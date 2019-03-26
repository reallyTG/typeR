library(ggtern)


### Name: geom_mask
### Title: Apply Manual Clipping Mask
### Aliases: geom_mask GeomMask
### Keywords: datasets

### ** Examples

data(Feldspar)
x = ggtern(Feldspar,aes(Ab,An,Or,label=Experiment)) + geom_point()

#Default Behaviour
x + geom_label()

#Insert manual mask before the labels, to prevent them being truncated
x + geom_point(size=6) + geom_mask() + geom_label()



