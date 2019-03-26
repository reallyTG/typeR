library(Map2NCBI)


### Name: MapMarkers
### Title: Mapping SNP Markers to Closest Genomic Feature
### Aliases: MapMarkers

### ** Examples

#Example 1: Step 1 includes running "GetGeneList" function. 
#As this step is interactive, a dataset from Bos taurus has 
#been generated and available to use in the \data folder as 
#well as a subset of marker information from BTA 1. Use the 
#following code to run this example:

data(GeneList_BTA1)
data(Example10MarkerFile)  
Example1 = MapMarkers(GeneList_BTA1, Example10MarkerFile, 
    nAut=29,other="X",savefiles = FALSE)

#Note, this example will not save the output to the working 
#directory, but will return the information to "Example1" 
#variable.



