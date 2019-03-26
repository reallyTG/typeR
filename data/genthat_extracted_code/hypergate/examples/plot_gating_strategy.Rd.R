library(hypergate)


### Name: plot_gating_strategy
### Title: plot_gating_strategy
### Aliases: plot_gating_strategy

### ** Examples

data(Samusik_01_subset)
xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels]
gate_vector=Samusik_01_subset$labels
hg=hypergate(xp=xp,gate_vector=gate_vector,level=23,delta_add=0.01)
par(mfrow=c(1,ceiling(length(hg$active_channels)/2)))
plot_gating_strategy(gate=hg,xp=xp,gate_vector=gate_vector,level=23,highlight="red")



