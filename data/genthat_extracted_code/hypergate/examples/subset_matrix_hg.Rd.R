library(hypergate)


### Name: subset_matrix_hg
### Title: subset_matrix_hg
### Aliases: subset_matrix_hg

### ** Examples

data(Samusik_01_subset)
xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels]
gate_vector=Samusik_01_subset$labels
hg=hypergate(xp=xp,gate_vector=gate_vector,level=23,delta_add=0.01)
gating_state=subset_matrix_hg(hg,xp)
gating_state=ifelse(gating_state,"Gated in","Gated out")
target=ifelse(gate_vector==23,"Target events","Others")
table(gating_state,target)



