library(hypergate)


### Name: hypergate
### Title: hypergate
### Aliases: hypergate

### ** Examples

data(Samusik_01_subset)
xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels]
gate_vector=Samusik_01_subset$labels
hg=hypergate(xp=xp,gate_vector=gate_vector,level=23,delta_add=0.01)



