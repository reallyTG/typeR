library(MASSTIMATE)


### Name: MR
### Title: Body Mass Estimates Using Campione and Evans (2012)
### Aliases: MR

### ** Examples

##Dinosaur data from Campione and Evans (2012) for quadrupedal dinosaurs
data(dinos)

##Combined equation based on the raw regression
MR(dinos$HC, dinos$FC, equation = "raw", data = dinos)

##Combined equation based on the phylogenetically corrected regression, data not specified
MR(dinos$HC, dinos$FC, equation = "phylocor")



