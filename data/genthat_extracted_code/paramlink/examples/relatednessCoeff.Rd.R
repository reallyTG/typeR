library(paramlink)


### Name: relatednessCoeff
### Title: Relatedness coefficients
### Aliases: relatednessCoeff inbreeding kinship.coeff jacquard jacquard2

### ** Examples


# Offspring of first cousins
x = cousinsPed(1, child=TRUE)
inb = inbreeding(x)
stopifnot(inb[9] == 1/16)

# if ID labels are not 1:9, care must be taken in extracting correct elements.
set.seed(1357)
y = relabel(x, sample(1:9))
child = leaves(y)
inbreeding(y)[child] #wrong
inb = inbreeding(y)[as.character(child)] #correct
inb
# the inbreeding coeff of the child equals the kinship coeff of parents
kin = kinship.coeff(y, parents(y, child))
stopifnot(inb==kin, inb==1/16)




