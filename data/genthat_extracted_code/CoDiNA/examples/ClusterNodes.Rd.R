library(CoDiNA)


### Name: ClusterNodes
### Title: ClusterNodes
### Aliases: ClusterNodes

### ** Examples

DiffNet = MakeDiffNet (Data = list(CTR,  AST), Code = c('CTR', 'AST') )
Genes_Phi = ClusterNodes(DiffNet, cutoff.external = 0.5, cutoff.internal = 0.25)
table(Genes_Phi$Phi_tilde)




