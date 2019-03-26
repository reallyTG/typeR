library(qtl)


### Name: mqmplot.directedqtl
### Title: Plot LOD*Effect curves of a multiple-QTL model
### Aliases: mqmplot.directedqtl
### Keywords: hplot

### ** Examples

#Simulated F2 Population
f2qtl <- c(3,15,1,0)                                    # QTL at chromosome 3
data(map10)                                             # Mouse genetic map
## Don't show: 
map10 <- map10[1:3]
## End(Don't show)
f2cross <- sim.cross(map10,f2qtl,n=100,type="f2")       # Simulate a F2 Cross
f2cross <- fill.geno(f2cross)                           # Fill in missing genotypes
f2result <- mqmscan(f2cross)                        # Do a MQM scan of the genome
mqmplot.directedqtl(f2cross,f2result)



