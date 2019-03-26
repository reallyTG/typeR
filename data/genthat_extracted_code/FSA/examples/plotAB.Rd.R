library(FSA)


### Name: plotAB
### Title: Construct traditional (Campana-like) age-bias plots.
### Aliases: plotAB
### Keywords: htest manip

### ** Examples

# Must create ageBias object first
ab1 <- ageBias(scaleC~otolithC,data=WhitefishLC,
               ref.lab="Otolith Age",nref.lab="Scale Age")
               
# Default plot
plotAB(ab1)

# Very close to Campana et al. (2001)
plotAB(ab1,pch.mean.sig=19,col.CIsig="black",sfrac=0.01,
       ylim=c(-1,23),xlim=c(-1,23))
# Show sample sizes (different position and size than default)
plotAB(ab1,show.n=TRUE,nYpos=0.02,cex.n=0.5)

# Traditional numbers plot
plotAB(ab1,what="numbers") 




