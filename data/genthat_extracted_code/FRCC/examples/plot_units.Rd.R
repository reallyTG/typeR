library(FRCC)


### Name: plot_units
### Title: Plots the experimental units in the Canonical Variates Space
### Aliases: plot_units
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Example: NCI-60 micrRNA Data
data("Topoisomerase_II_Inhibitors")
data("microRNA")
my_res <- frcc(t(microRNA),-1*t(Topoisomerase_II_Inhibitors))
for( i in 1:dim(microRNA)[2])
{
 colnames(microRNA)[i]<-substr(colnames(microRNA)[i], 1, 2)
}#end for i
dev.new()
plot_units(t(microRNA),-1*t(Topoisomerase_II_Inhibitors),my_res,1,1,text_size=0.01)



