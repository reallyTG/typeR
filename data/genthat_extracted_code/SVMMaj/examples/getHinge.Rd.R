library(SVMMaj)


### Name: getHinge
### Title: Hinge error function of SVM-Maj
### Aliases: getHinge print.hinge

### ** Examples

hingefunction <- getHinge()
## plot hinge function value and, if specified, 
## the majorization function at z
## plot(hingefunction, z = 3)
## generate loss function value
loss  <- hingefunction(q = -10:10, y = 1)$loss
print(loss)
plot(hingefunction, z = 3)



