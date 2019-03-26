library(BCellMA)


### Name: aa_dist
### Title: Average frequency of nucleotide mutations resulting in amino
###   acid substitution in FRs and CDRs
### Aliases: aa_dist

### ** Examples

data(IMGTtab7)
Regions<-cbind(IMGTtab7$FR1_IMGT,IMGTtab7$CDR1_IMGT, IMGTtab7$FR2_IMGT)
Regions_matrix<-aa_dist(data=Regions)




