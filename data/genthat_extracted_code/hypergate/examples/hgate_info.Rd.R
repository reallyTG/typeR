library(hypergate)


### Name: hgate_info
### Title: hgate_info
### Aliases: hgate_info

### ** Examples

data(Samusik_01_subset)
xp=Samusik_01_subset$xp_src[,Samusik_01_subset$regular_channels]
gate_vector=Samusik_01_subset$labels
hg=hypergate(xp=xp,gate_vector=gate_vector,level=23,delta_add=0.01)
hgate_info(hgate=hg)
hgate_pheno(hgate=hg)
hgate_rule(hgate=hg)



