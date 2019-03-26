library(fishmethods)


### Name: remp
### Title: Random Number Generation from an Empirical Distribution
### Aliases: remp
### Keywords: misc

### ** Examples

# Striped bass recruits per spawning stock biomass ratios 
# for 2001-2011 from 2013 assessment
ratios<-c(799.22,794.78,969.81,1038.80,1101.45,1117.46,1126.16,
          1647.51,1882.30,1966.13,2189.25)
 # Select new recruits per SSB ratio for projection
 remp(1,ratios)



