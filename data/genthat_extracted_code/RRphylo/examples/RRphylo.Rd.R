library(RRphylo)


### Name: RRphylo
### Title: Evolutionary rates computation along phylogenies
### Aliases: RRphylo

### ** Examples

 ## No test: 
data("DataOrnithodirans")
DataOrnithodirans$treedino->treedino
DataOrnithodirans$massdino->massdino

# Case 1. "RRphylo" without accounting for the effect of a covariate
    RRphylo(tree=treedino,y=massdino)

# Case 2. "RRphylo" accounting for the effect of a covariate
  # "RRphylo" on the covariate in order to retrieve ancestral state values
    RRphylo(tree=treedino,y=massdino)->RRcova
    c(RRcova$aces,massdino)->cov.values
    c(rownames(RRcova$aces),names(massdino))->names(cov.values)

    RRphylo(tree=treedino,y=massdino,cov=cov.values)

# Case 3. "RRphylo" specifying the ancestral states
  data("DataCetaceans")
  DataCetaceans$treecet->treecet
  DataCetaceans$masscet->masscet
  DataCetaceans$aceMyst->aceMyst

    RRphylo(tree=treecet,y=masscet,aces=aceMyst)

    
## End(No test)



