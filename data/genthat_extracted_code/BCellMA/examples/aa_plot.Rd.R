library(BCellMA)


### Name: aa_plot
### Title: Plot of average frequency of nucleotide mutations resulting in
###   amino acid substitution
### Aliases: aa_plot

### ** Examples

data(IMGTtab7)
Regions<-cbind(IMGTtab7$FR1_IMGT,IMGTtab7$CDR1_IMGT)
allRegions_matrix<-aa_dist(Regions)
data(Klassen)
aa_plot(allRegions_matrix, "Amino acid Distribution", "right", Klassen)



