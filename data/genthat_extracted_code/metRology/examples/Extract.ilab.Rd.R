library(metRology)


### Name: Extract.ilab
### Title: The 'ilab' class.
### Aliases: Extract.ilab subset.ilab [.ilab
### Keywords: manip

### ** Examples

data(Pb)
il.pb<-construct.ilab(org=Pb$lab, x=Pb$value, measurand="Pb", item="none", 
                u=Pb$u, k=Pb$k, U=Pb$U, title=c("CCQM K30", "Lead in wine"), method=Pb$method)

subset(il.pb, u < 0.03)

il.pb[1:6,]




