library(r.jive)


### Name: showVarExplained
### Title: Display Variance Explained
### Aliases: showVarExplained

### ** Examples

##Load JIVE results (using default settings) for simulated data 
##as in Section 2.4 of Lock et al., 2013,
##with rank 1 joint structure, and rank 1 individual structure for each dataset
data(SimResults) 
# Visualize results
showVarExplained(Results)
# showVarExplained is also called by the "jive" S3 class default plot method
plot(Results)



