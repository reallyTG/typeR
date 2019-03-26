library(ParentOffspring)


### Name: ParentOffspring
### Title: Conduct the Parent-Offspring Test Using Monomorphic SNP Markers
### Aliases: ParentOffspring
### Keywords: parent offspring test monomorphic SNP markers

### ** Examples


# a very simple example

genotypeMatrix = matrix( 
    c("GG",  "GG",   "GG",  "CG",  "CG",  "GG",
      "AA",  "AA",   "AA",  "--",  "AA",  "AA", 
      "AA",  "AA",   "GG",  "AA",  "AA",  "AA", 
      "GG",  "AA",   "GG",  "GG",	 "GG",  "GG"),  
    byrow=TRUE, 
    nrow=4, 
    ncol=6) 
# Compute and plot the parent-offspring similarity for each offspring
ParentOffspring(genotypeMatrix)




