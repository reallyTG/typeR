library(FRCC)


### Name: microRNAs
### Title: NCI-60 microRNA data
### Aliases: microRNA
### Keywords: microRNA NCI-60

### ** Examples

#Example #3 NCI-60 micrRNA Data
data("Topoisomerase_II_Inhibitors")
data("microRNA")
my_res <- frcc(t(microRNA),-1*t(Topoisomerase_II_Inhibitors))



