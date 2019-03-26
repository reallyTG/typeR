library(magic)


### Name: panmagic.8
### Title: Panmagic squares of order 8
### Aliases: panmagic.8
### Keywords: array

### ** Examples

is.panmagic(panmagic.8(chosen=2:7))
is.normal(panmagic.8(chosen=2:7))
is.normal(panmagic.8(chosen=c(1,2,3,6,7,8)))

#to see the twelve basis magic carpets, set argument 'chosen' to each
#integer from 1 to 12 in turn, with vals=1:

panmagic.8(chosen=1,vals=1)-1
image(panmagic.8(chosen=12,vals=1))




