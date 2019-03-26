library(rich)


### Name: Tomicus
### Title: Maximum temperature at sites hosting 2 species of closely
###   related bark-beetles of genus Tomicus
### Aliases: Tomicus

### ** Examples

## Comparing mean temperatures at sites where either T. destruens,
## T. piniperda or both are present using comp2mean
data(Tomicus)
c2m(pop1=Tomicus$destruens,pop2=Tomicus$piniperda,
pop3=Tomicus$both, nrandom=99)



