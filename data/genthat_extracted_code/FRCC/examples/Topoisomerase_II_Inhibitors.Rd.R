library(FRCC)


### Name: Topoisomerase_II_Inhibitors
### Title: NCI-60 Topoisomerase II Inhibitor Data.
### Aliases: Topoisomerase_II_Inhibitors
### Keywords: Topoisomerase_II_Inhibitor NCI-60

### ** Examples

#Example #3 NCI-60 micrRNA Data
data("Topoisomerase_II_Inhibitors")
data("microRNA")
my_res <- frcc(t(microRNA),-1*t(Topoisomerase_II_Inhibitors))



