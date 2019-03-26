library(metRology)


### Name: methods.ilab
### Title: Methods for the 'ilab' class.
### Aliases: methods.ilab print.ilab plot.ilab
### Keywords: methods

### ** Examples

data(Pb)
il.pb<-construct.ilab(org=Pb$lab, x=Pb$value, measurand="Pb", item="none", 
                u=Pb$u, k=Pb$k, U=Pb$U, title=c("CCQM K30", "Lead in wine"), method=Pb$method)

print(il.pb)

plot(il.pb)




