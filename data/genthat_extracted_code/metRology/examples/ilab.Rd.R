library(metRology)


### Name: ilab-class
### Title: The 'ilab' class.
### Aliases: ilab-class construct.ilab
### Keywords: methods

### ** Examples

data(Pb)
construct.ilab(org=Pb$lab, x=Pb$value, measurand="Pb", item="none", 
                u=Pb$u, k=Pb$k, U=Pb$U, title=c("CCQM K30", "Lead in wine"), 
                method=Pb$method)

#Illustrate default for U and automatic distrib.pars
construct.ilab(org=Pb$lab, x=Pb$value, measurand="Pb", item="none", 
                u=Pb$u, k=Pb$k, distrib="norm")

construct.ilab(org=Pb$lab, x=Pb$value, measurand="Pb", item="none", 
                u=Pb$u, k=Pb$k, distrib="t.scaled")




