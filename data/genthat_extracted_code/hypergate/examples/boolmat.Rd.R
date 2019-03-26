library(hypergate)


### Name: boolmat
### Title: boolmat
### Aliases: boolmat

### ** Examples

data(Samusik_01_subset)
xp=Samusik_01_subset$xp_src
gate_vector=Samusik_01_subset$labels
hg=hypergate(xp=xp,gate_vector=gate_vector,level=23,delta_add=0.01)
head(boolmat(hg,xp))



