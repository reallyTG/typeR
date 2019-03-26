library(metRology)


### Name: rbind.ilab
### Title: Combine 'ilab' objects
### Aliases: rbind cbind rbind.default cbind.default rbind.ilab cbind.ilab
###   c.ilab
### Keywords: manip

### ** Examples

data(Pb)
il1<-construct.ilab(org=Pb$lab, x=Pb$value, measurand="Pb", item="none", 
                u=Pb$u, k=Pb$k, U=Pb$U, title=c("CCQM K30", "Lead in wine"),
                method=Pb$method)

rbind(il1, il1)




