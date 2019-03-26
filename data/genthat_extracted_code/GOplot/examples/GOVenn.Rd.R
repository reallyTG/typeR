library(GOplot)


### Name: GOVenn
### Title: Venn diagram of differentially expressed genes.
### Aliases: GOVenn

### ** Examples

## Not run: 
##D #Load the included dataset
##D data(EC)
##D 
##D #Generating the circ object
##D circ<-circular_dat(EC$david, EC$genelist)
##D 
##D #Selecting terms of interest
##D l1<-subset(circ,term=='heart development',c(genes,logFC))
##D l2<-subset(circ,term=='plasma membrane',c(genes,logFC))
##D l3<-subset(circ,term=='tissue morphogenesis',c(genes,logFC))
##D 
##D GOVenn(l1,l2,l3, label=c('heart development','plasma membrane','tissue morphogenesis'))
## End(Not run)



