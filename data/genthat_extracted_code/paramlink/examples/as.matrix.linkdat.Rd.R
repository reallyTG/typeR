library(paramlink)


### Name: as.matrix.linkdat
### Title: linkdat to matrix conversion
### Aliases: as.matrix.linkdat restore_linkdat

### ** Examples


x = linkdat(toyped, model=1)
y = restore_linkdat(as.matrix(x))
stopifnot(all.equal(x,y))

# If attributes are lost during matrix manipulation: Use the 'attrs' argument.
xmatr = as.matrix(x)
newmatr = xmatr[-4, ] # NB: attributes are lost here
z = restore_linkdat(newmatr, attrs = attributes(xmatr))

# Should be the same as:
z2 = removeIndividuals(x, 4)
stopifnot(all.equal(z, z2))




