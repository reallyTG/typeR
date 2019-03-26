library(baitmet)


### Name: decBaitMet
### Title: Library-driven deconvolution of compounds by BaitMet
### Aliases: decBaitMet

### ** Examples


# Library-driven deconvolution from an experiment created by \code{newExp}.

# ex <- newExp(instrumental="path")

# Now, we have to set up a chromatographic method:

Chrm.PLASMA <- setChrmMethod(method="alk.var5", 
rt=c(8.39, 10.759, 13.271, 15.604, 17.751, 19.685, 
21.471, 23.126, 24.645), ri=c(1225.27, 1326.95, 1526.31, 
1729.57, 1928.52, 2131.7, 2342.06, 2548.56, 2739.86), 
name="Test Chrm Method")

# The following will set BaitMet for analyzing the chromatograms
# without taking into account the masses 1:69,73:75,147:149, 
# (since is the mass range of the Golm Metabolome Database)
# with a minimum peak width of 2 seconds.

ext.par <- setBaitPar(ri.error=0.05, min.peak.width=2,  
min.peak.height=1000, noise.threshold=100, 
avoid.processing.mz=c(1:69,73:75,147:149))

# An now deconvolve the compounds in the samples:
# ex <- decBaitMet(ex, ext.par, chrom.method=Chrm.PLASMA)




