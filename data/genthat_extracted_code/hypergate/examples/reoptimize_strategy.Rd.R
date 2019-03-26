library(hypergate)


### Name: reoptimize_strategy
### Title: reoptimize_strategy
### Aliases: reoptimize_strategy

### ** Examples

data(Samusik_01_subset)
xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels]
gate_vector=Samusik_01_subset$labels
hg=hypergate(xp=xp,gate_vector=gate_vector,level=23,delta_add=0)
contribs=channels_contributions(gate=hg,xp=xp,gate_vector=gate_vector,level=23,beta=1)
significant_channels=names(contribs)[contribs>=0.01]
hg_reoptimized=reoptimize_strategy(gate=hg,channels_subset=significant_channels,xp,gate_vector,23)



