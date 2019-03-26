library(RAM)


### Name: diversity.indices
### Title: Calculate True Diversity and Evenness
### Aliases: diversity.indices true.diversity evenness
### Keywords: manip

### ** Examples

data(ITS1, ITS2)
# true diversity, using default index (Simpson)
true.diversity(data=list(ITS1=ITS1))
# true diversity for ITS1 and ITS2, using Shannon
true.diversity(data=list(ITS1=ITS1, ITS2=ITS2), index="shannon")
# default evenness (Simpson) for ITS1/ITS2
evenness(data=list(ITS1=ITS1, ITS2=ITS2))
# Shannon evenness
evenness(data=list(ITS1=ITS1), index="shannon")



