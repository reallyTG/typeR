library(labdsv)


### Name: plot.thull
### Title: Plotting a Tensioned Hull
### Aliases: plot.thull thull
### Keywords: aplot

### ** Examples

    data(bryceveg) # returns a dataframe called bryceveg
    dis.bc <- dsvdis(bryceveg,'bray') # calculates a Bray-Curtis 
                                      # dissimilarity matrix
    nmds.bc <- nmds(dis.bc) # calculates an NMDS ordination
    plot(nmds.bc) # plots the ordination on the current device
    demo.thull <- thull(nmds.bc,bryceveg$arcpat,0.25) # calculates 
                        # the tensioned hull representing the distribution 
                        # of a species
    plot(demo.thull) # portrays the image version of the tensioned hull



