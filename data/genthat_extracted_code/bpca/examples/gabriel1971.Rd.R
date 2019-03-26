library(bpca)


### Name: gabriel1971
### Title: Percentages of households having various facilities and
###   appliances in East Jerusalem Arab areas, by quarters of the town
### Aliases: gabriel1971
### Keywords: datasets

### ** Examples

##
## A simple example
##
data(gabriel1971)
bp <- bpca(gabriel1971)

dev.new(w=6, h=6)
plot(bp,
     var.factor=2)

# Exploring the object 'bp' created by the function 'bpca'
class(bp)
names(bp)
str(bp)

summary(bp)
bp$call
bp$eigenval
bp$eigenvec
bp$numb
bp$import
bp$coord
bp$coord$obj
bp$coord$var
bp$var.rb
bp$var.rd



