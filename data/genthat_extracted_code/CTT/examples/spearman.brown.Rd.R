library(CTT)


### Name: spearman.brown
### Title: Functions for Spearman-Brown "Prophecy" Formula
### Aliases: spearman.brown
### Keywords: misc

### ** Examples


# old relibility is 0.6, if the measure is lengthened 
# by a factor of 2, the relibility of new test is:
spearman.brown(0.6,2,"n")

# old relibility is 0.5, if we want a new measure to 
# be 0.8, the new test length is:
spearman.brown(0.5, 0.8, "r")



