library(r.jive)


### Name: showPCA
### Title: Principal Component Plots for JIVE Decomposition
### Aliases: showPCA

### ** Examples

##Load JIVE results (using default settings) for simulated data 
##as in Section 2.4 of Lock et al., 2013,
##with rank 1 joint structure, and rank 1 individual structure for each dataset
data(SimResults) 
# Visualize results
# Plot the three components, 1 joint and 1 individual from each source
showPCA(Results,1,c(1,1))
###This displays three scatterplots: 
#the first joint principal component vs. the first principal component individual to source 1,
#the first joint component vs.  the first component individual to source 2, and 
#the first component individual to source 1 vs. the first component individual to source 2.



